class FileManipulation

    def read_especific_line(line_number, path_to_file)
        IO.readlines(path_to_file)[line_number]
    end

    def open_file(path_to_file)
        File.open(path_to_file)
    end

    begin
        file = open("games.log")
        file.close
    rescue => exception
        puts "#{$!.class}: #{$!.message}"
    end

end
