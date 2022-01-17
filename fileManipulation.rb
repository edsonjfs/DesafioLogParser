class FileManipulation

    def printEspecificLine(lineNumber, pathToFile)
        IO.readlines(pathToFile)[lineNumber]
    end

end
