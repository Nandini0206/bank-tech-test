require 'account'

describe Account do

  describe '#initalize' do
    it 'has a balance of zero' do
      statement = Statement.new
	    account = Account.new(statement)
      expect(account.balance).to eq 0
    end

    it 'has a statement' do
      statement = Statement.new
	    account = Account.new(statement)
      expect(account.statement).to eq []
    end
  end

  describe '#deposit' do
    it 'add money to balance' do
      statement = Statement.new
	    account = Account.new(statement)
      account.deposit(50)
      expect(account.balance).to eq 50
    end
  end

  describe '#withdraw' do
    it 'reduce balance' do
      statement = Statement.new
	    account = Account.new(statement)
      account = Account.new
      account.deposit(50)
      account.withdraw(20)
      expect(account.balance).to eq 30
    end
  end
end
