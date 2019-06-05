# frozen_string_literal: true

require_relative 'transaction'
require_relative 'statement'

class Account
  attr_reader :balance, :transactions

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

  def statement
    @statement.show
  end

  def print_statement
    puts 'date || credit || debit || balance'
    statement.each.reverse do |transaction|
      display = transaction.date.strftime('%d/%m/%Y') + ' || '
      if transaction.credit.zero?
        display += ' || '
        display += transaction.debit.to_f.to_s
      elsif transaction.debit.zero?
        display += transaction.credit.to_f.to_s
        display += ' || '
      else
        display += transaction.credit.to_f.to_s
        display += ' || '
        display += transaction.debit.to_f.to_s
      end
      display += ' || ' + transaction.balance.to_f.to_s
      puts display
    end
  end

  private

  def update(credit, debit)
    transaction = Transaction.new(credit, debit, @balance)
    @statement.show << transaction
  end
end
