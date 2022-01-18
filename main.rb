require_relative  "lib/file_manipulation.rb"

file = FileManipulation.new("games.log")
line_to_be_printed = file.read_especific_line(1)
puts line_to_be_printed
