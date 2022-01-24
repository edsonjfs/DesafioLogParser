require_relative 'lib/file_manipulation'

file = FileManipulation.new('games.log')
puts file.first_line
puts file.info_log_to_json
