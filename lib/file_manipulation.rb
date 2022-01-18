class FileManipulation
  
  def initialize(path_to_file)
    @path_to_file = path_to_file
    File.open(path_to_file)
  end

  def read_especific_line(line_number, path_to_file)
    IO.readlines(path_to_file)[line_number]
  end

  def is_closed(path_to_file)
    File.open(path_to_file).closed?
  end

  begin
    file = open("games.log")
    file.close
  rescue => exception
    puts "#{$!.class}: #{$!.message}"
  end

end
