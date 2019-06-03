require 'account'

describe Account do

  describe '#initalize' do
    it 'has a balance of zero' do
      account = Account.new
      expect(account.balance).to eq 0
    end
  end

  describe '#deposit' do
    it 'add money to balance' do
      account = Account.new
      account.deposit(10)
      expect(account.balance).to eq 10
    end
  end
end
