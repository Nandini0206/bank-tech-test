require 'statement'

describe Statement do
  describe '#initialize' do
    it 'starts off empty' do
      statement = Statement.new
      expect(statement.show).to eq []
    end
  end

  describe 'list of transactions' do
    it 'can add new transaction' do
      statement = Statement.new
      transaction = Transaction.new(20, nil, 80)
      statement.show << transaction
      expect(statement.show).to eq [transaction]
    end
  end
end
