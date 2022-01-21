require 'json'

class FileManipulation 
  def initialize(path_to_file)
    @path_to_file = path_to_file
    @number_of_lines = File.readlines(@path_to_file).size
    file = File.open(@path_to_file)
    file.close
  end

  def first_line
    File.readlines(@path_to_file)[0].chomp
  end

  def file_lines_to_json
    hash = { @path_to_file => { 'lines' => @number_of_lines } }
    hash.to_json
  end
end
