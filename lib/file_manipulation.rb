class FileManipulation
  
  def initialize(path_to_file)
    @path_to_file = path_to_file
    file = File.open(@path_to_file)
    file.close
  end
  
  def first_line
    File.readlines(@path_to_file)[0].chomp
  end
end
