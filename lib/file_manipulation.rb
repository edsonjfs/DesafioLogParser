class FileManipulation
  
  def initialize(path_to_file)
    @path_to_file = path_to_file
    
    begin
      file = open(@path_to_file)
      file.close
    rescue => exception
      puts "#{$!.class}: #{$!.message}"
    end
  end

  def return_first_line
    IO.readlines(@path_to_file)[0]
  end

  def exists?
    File.exists?(@path_to_file)
  end
end
