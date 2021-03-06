require_relative '../lib/file_manipulation'

describe FileManipulation do
  describe '#first_line' do
    it 'print fisrt line from a file' do
      printed_line = FileManipulation.new('false_games.log').first_line
      expect(printed_line).to eql('  0:00 ------------------------------------------------------------')
    end
  end

  describe '#initialize' do
    it 'tests if the file does exists' do
      expect { FileManipulation.new('invalid_path_file') }.to raise_error(Errno::ENOENT)
    end
  end

  describe '#info_log_to_json' do
    it 'tests if the method is returning correctly the JSON object' do
      file = FileManipulation.new('false_games.log')
      json = {
        'false_games.log' => {
          'lines' => 15,
          'players' => ['Isgalamido', 'Dono da Bola', 'Assasinu Credi', 'Zeh'],
          'kills' => { 'Isgalamido' => -1, 'Dono da Bola' => 1, 'Assasinu Credi' => 0, 'Zeh' => -1 },
          'total_kills' => 9
        }
      }.to_json
      expect(file.info_log_to_json).to eql(json)
    end
  end
end
