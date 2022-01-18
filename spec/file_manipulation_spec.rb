require_relative "../lib/file_manipulation"

  describe FileManipulation do
    describe "#print_especific_line" do
      it "print specific line from a file" do
        printed_line = FileManipulation.new("games.log").read_especific_line(1)
        expect(printed_line).to eql("  0:00 InitGame: \\sv_floodProtect\\1\\sv_maxPing\\0\\sv_minPing\\0\\sv_maxRate\\10000\\sv_minRate\\0\\sv_hostname\\Code Miner Server\\g_gametype\\0\\sv_privateClients\\2\\sv_maxclients\\16\\sv_allowDownload\\0\\dmflags\\0\\fraglimit\\20\\timelimit\\15\\g_maxGameClients\\0\\capturelimit\\8\\version\\ioq3 1.36 linux-x86_64 Apr 12 2009\\protocol\\68\\mapname\\q3dm17\\gamename\\baseq3\\g_needpass\\0\n")
      end
    end
    
    describe "#print_especific_line" do
        it "print specific line from a false log file" do
          printed_line = FileManipulation.new("false_log.log").read_especific_line(1)
          expect(printed_line).to eql(nil)
        end
      end

  describe "#open_file" do 
    it "test if the file can be opened and exists" do
      file = FileManipulation.new("games.log").exists
      expect(file).to eql(true)
    end
  end
end
