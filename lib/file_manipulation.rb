require_relative 'players_log'
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
    players = PlayersLog.new(@path_to_file)
    hash = { @path_to_file => { 'lines' => number_of_lines, 'players' => players.players_names } }
    hash.to_json
  end

  private

  def number_of_lines
    File.readlines(@path_to_file).size
  end
end
