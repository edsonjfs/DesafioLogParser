require_relative "../lib/file_manipulation"

  describe FileManipulation do
    describe "#return_first_line" do
      it "print fisrt line from a file" do
        printed_line = FileManipulation.new("false_games.log").return_first_line
        expect(printed_line).to eql("  0:00 ------------------------------------------------------------\n")
      end
    end

  describe "#open_file" do 
    it "test if the file can be opened and exists" do
      file = FileManipulation.new("false_games.log").exists?
      expect(file).to eql(true)
    end
  end
end
