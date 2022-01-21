require_relative  "lib/file_manipulation.rb"

file = FileManipulation.new("games.log")
puts file.first_line
