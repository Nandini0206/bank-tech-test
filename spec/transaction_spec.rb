require 'transaction'

describe Transaction do

  describe '#intialize' do
    it 'make a deposit' do
      transaction = Transaction.new(20, nil, 80)
      expect(transaction.credit).to eq 20
      expect(transaction.debit).to eq nil
      expect(transaction.balance).to eq 80
    end
  end
end
