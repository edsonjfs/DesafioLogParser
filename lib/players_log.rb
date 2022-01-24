class PlayersLog
  def initialize(path_to_file)
    @path_to_file = path_to_file
    @all_players = []
  end

  def players_names
    File.readlines(@path_to_file).each do |line|
      if line.include?('ClientUserinfoChanged:')
        splited_line_with_name_in_position_one = line.split(/[\\\\]/)
        player_name = splited_line_with_name_in_position_one[1]
        @all_players.push(player_name) unless @all_players.include?(player_name)
      end
    end
    @all_players
  end
end
