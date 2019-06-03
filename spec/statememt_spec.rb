require 'statement'

describe Statement do
  describe '#initialize' do
    it 'starts off empty' do
      statement = Statement.new
      expect(statement.show).to eq []
    end
  end
end
