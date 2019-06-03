require 'transaction'
require 'Timecop'

describe Transaction do

  describe '#intialize' do
    it 'make a deposit' do
      Timecop.freeze do
        transaction = Transaction.new(20, nil, 80)
        expect(transaction.credit).to eq 20
        expect(transaction.debit).to eq nil
        expect(transaction.balance).to eq 80
        expect(transaction.date).to eq Time.now
      end
    end

    it 'make a withdrawal' do
      Timecop.freeze do
        transaction = Transaction.new(nil, 20, 80)
        expect(transaction.credit).to eq nil
        expect(transaction.debit).to eq 20
        expect(transaction.balance).to eq 80
        expect(transaction.date).to eq Time.now
      end
    end
  end
end
