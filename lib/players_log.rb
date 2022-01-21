class PlayersLog
  INDEX_CORRECTION_BEGIN_NAME = 2

  def initialize(path_to_file)
    @path_to_file = path_to_file
    @all_players = []
  end

  def players_names
    File.readlines(@path_to_file).each do |line|
      if line.include?('ClientUserinfoChanged:')
        begin_of_player_name = line.index('n\\') + INDEX_CORRECTION_BEGIN_NAME
        end_of_player_name = line.index('\\t\\')
        name_length = end_of_player_name - begin_of_player_name
        player_name = line[begin_of_player_name, name_length]
        @all_players.push(player_name) unless @all_players.include?(player_name)
      end
    end
    @all_players
  end
end
