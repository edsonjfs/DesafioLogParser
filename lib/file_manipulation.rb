require 'json'

class FileManipulation
  def initialize(path_to_file)
    @path_to_file = path_to_file
    file = File.open(@path_to_file)
    file.close
  end

  def first_line
    File.readlines(@path_to_file)[0].chomp
  end

  def info_log_to_json
    hash = { @path_to_file => { 'lines' => number_of_lines, 'players' => players_names, 'kills' => players_kills, 'total_kills' => total_kills } }
    hash.to_json
  end

  private

  def number_of_lines
    File.readlines(@path_to_file).size
  end

  def players_names
    all_players = []
    File.readlines(@path_to_file).each do |line|
      if line.include?('ClientUserinfoChanged:')
        splited_line_with_name_in_position_one = line.split(/[\\\\]/)
        player_name = splited_line_with_name_in_position_one[1]
        all_players.push(player_name) unless all_players.include?(player_name)
      end
    end
    all_players
  end

  def players_kills
    players = players_names
    kills_occurrences = []
    suicide_kills = []
    kill_count = {}
    File.readlines(@path_to_file).each do |line|
      players.each do |player|
        if line.include?("#{player} killed")
          unless line.include?("#{player} killed #{player}")
            kills_occurrences.push(player)
          end
        end
        if line.include?("#{player} killed #{player}")
          suicide_kills.push(player)
        end
      end
    end
    players.each do |player|
      kills = kills_occurrences.count { |player_name| player_name == player }
      suicides = suicide_kills.count(player)
      kill_count[player] = kills - suicides
    end
    kill_count
  end

  def total_kills
    players = players_names
    kills_occurrences = []
    File.readlines(@path_to_file).each do |line|
      players.each do |player|
        if line.include?("#{player} killed")
          kills_occurrences.push(player)
        end
      end
    end
    kills_occurrences.count
  end
end
