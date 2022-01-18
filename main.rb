require_relative  "fileManipulation"

file = FileManipulation.new()
line_to_be_printed = file.read_especific_line(1,"games.log")
puts line_to_be_printed

