require_relative 'transaction'
require_relative 'statement'

class Account

  attr_reader :balance

  def initialize(statement = Statement.new)
    @balance = 0
    @statement = statement
  end

  def deposit(amount)
    @balance += amount
    update(amount, 0)
  end

  def withdraw(amount)
    @balance -= amount
    update(0, amount)
  end

  def balance
    @balance
  end

  def statement
    @statement.show
  end

  def transactions
    @transactions
  end

  def print_statement
    puts 'date || credit || debit || balance'
    statement.each do |transaction|
      if transaction.credit == 0
 	      display = transaction.date.strftime('%d/%m/%Y') + ' || '
 	      display += '  || '
 	      display += transaction.debit.to_f.to_s
 	      display += ' || ' + transaction.balance.to_f.to_s
 	    elsif transaction.debit == 0
 	      display = transaction.date.strftime('%d/%m/%Y') + ' || '
 	      display += transaction.credit.to_f.to_s
 	      display += ' || '
 	      display += '  || ' + transaction.balance.to_f.to_s
 	    else
 	      display = transaction.date.strftime('%d/%m/%Y') + ' || '
 	      display += transaction.credit.to_f.to_s
 	      display += ' || '
 	      display += transaction.debit.to_f.to_s
 	      display += ' || ' + transaction.balance.to_f.to_s
 	    end
 	      puts display
    end
  end

  private

  def update(credit, debit)
    transaction = Transaction.new(credit, debit, @balance)
    @statement.show << transaction
  end
end
