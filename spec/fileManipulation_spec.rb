require '../DesafioLogParser/fileManipulation.rb'

describe FileManipulation do
    describe "#printEspecificLine" do
        it "print specific line from a file" do
            printedLine = FileManipulation.new().printEspecificLine(1,"games.log")
            expect(printedLine).to eql("  0:00 InitGame: \\sv_floodProtect\\1\\sv_maxPing\\0\\sv_minPing\\0\\sv_maxRate\\10000\\sv_minRate\\0\\sv_hostname\\Code Miner Server\\g_gametype\\0\\sv_privateClients\\2\\sv_maxclients\\16\\sv_allowDownload\\0\\dmflags\\0\\fraglimit\\20\\timelimit\\15\\g_maxGameClients\\0\\capturelimit\\8\\version\\ioq3 1.36 linux-x86_64 Apr 12 2009\\protocol\\68\\mapname\\q3dm17\\gamename\\baseq3\\g_needpass\\0\n")
        end
    end

    describe "#openFile" do 
        it "test if the file can be opened and exists" do
            file = open("games.log")
            expect(file.closed?).to eql(false)
        end
    end

end


