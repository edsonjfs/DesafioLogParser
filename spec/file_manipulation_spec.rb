require_relative "../lib/file_manipulation"

  describe FileManipulation do
    describe "#first_line" do
      it "print fisrt line from a file" do
        printed_line = FileManipulation.new("false_games.log").first_line
        expect(printed_line).to eql("  0:00 ------------------------------------------------------------")
      end
    end

  describe "#invalid_path" do 
    it "tests if the file does exists" do
      expect{FileManipulation.new("invalid_path_file")}.to raise_error(RuntimeError)
    end
  end
end
