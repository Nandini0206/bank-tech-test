# frozen_string_literal: true

class Transaction
  attr_reader :date, :credit, :debit, :balance

  def initialize(credit, debit, balance)
    @credit = credit
    @balance = balance
    @debit = debit
    @date = Time.now
  end
end
