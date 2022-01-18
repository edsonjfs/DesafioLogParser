class FileManipulation
  
  def initialize(path_to_file)
    @path_to_file = path_to_file
    @file = File.open(path_to_file)
    
    begin
      file = open(@path_to_file)
      file.close
    rescue => exception
      puts "#{$!.class}: #{$!.message}"
    end
  end

  def read_especific_line(line_number)
    IO.readlines(@path_to_file)[line_number]
  end

  def exists
    File.exists?(@path_to_file)
  end
end
