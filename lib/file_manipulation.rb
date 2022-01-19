class FileManipulation
  
  def initialize(path_to_file)
    @path_to_file = path_to_file
    
    raise ("File doesn't exists") if !File.exists?(@path_to_file)
  end

  def first_line
    File.readlines(@path_to_file)[0].chomp
  end
end
