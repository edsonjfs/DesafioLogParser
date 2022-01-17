class FileManipulation

    def printEspecificLine(lineNumber, pathToFile)
        IO.readlines(pathToFile)[lineNumber]
    end

    begin
        file = open("games.log")
    rescue => exception
        puts "#{$!.class}: #{$!.message}"
    end

end
