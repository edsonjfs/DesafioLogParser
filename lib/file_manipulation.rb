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
    hash = {
      @path_to_file => {
        'lines' => number_of_lines,
        'players' => players_names,
        'kills' => players_kills,
        'total_kills' => total_kills
      }
    }
    hash.to_json
  end

  private

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
    world_kills = []

    File.readlines(@path_to_file).each do |line|
      players.each do |player|
        add_kill_occurence(kills_occurrences, player, line) if line.include?("#{player} killed")
        suicide_kills.push(player) if line.include?("#{player} killed #{player}")
        world_kills.push(player) if line.include?("<world> killed #{player}")
      end
    end

    kill_counter(players, kills_occurrences, suicide_kills, world_kills, kill_count)
    kill_count
  end

  def total_kills
    players = players_names
    kills_occurrences = []

    File.readlines(@path_to_file).each do |line|
      players.each do |player|
        kills_occurrences.push(player) if line.include?("#{player} killed")
        kills_occurrences.push('<world>') if line.include?("<world> killed #{player}")
      end
    end

    kills_occurrences.count
  end

  def add_kill_occurence(kills_occurrences, player, line)
    kills_occurrences.push(player) unless line.include?("#{player} killed #{player}")
  end

  def kill_counter(players, kills_occurrences, suicide_kills, world_kills, kill_count)
    players.each do |player|
      kills = kills_occurrences.count { |player_name| player_name == player }
      suicides = suicide_kills.count(player)
      world_killed_player = world_kills.count(player)
      kill_count[player] = kills - suicides - world_killed_player
    end
  end

  def number_of_lines
    File.readlines(@path_to_file).size
  end
end
