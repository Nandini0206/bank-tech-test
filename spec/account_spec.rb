# frozen_string_literal: true

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

    it 'raises error when negative balance inputed' do
      statement = Statement.new
      account = Account.new(statement)
      expect { account.deposit(-10) }.to raise_error "Invalid amount"
    end
  end

  describe '#withdraw' do
    it 'raises error if current balance is less than withdraw amount' do
      statement = Statement.new
      account = Account.new(statement)
      account.deposit(50)
      expect {account.withdraw(80)}.to raise_error "Insufficient funds available"
    end

    it 'reduce balance' do
      account = Account.new
      account.deposit(50)
      account.withdraw(20)
      expect(account.balance).to eq 30
    end
  end

  describe '#print_statement' do
    it 'prints statment header' do
      statement = Statement.new
      account = Account.new(statement)
      expect { account.print_statement }.to output("date || credit || debit || balance\n").to_stdout
    end

    it 'prints list of transactions' do
      statement = Statement.new
      account = Account.new(statement)
      account.deposit(100)
      account.withdraw(20)
      expect { account.print_statement }.to output("date || credit || debit || balance\n05/06/2019 || 100.0 ||  || 100.0\n05/06/2019 ||  || 20.0 || 80.0\n").to_stdout
    end
  end
end
