class Transaction

  attr_reader :credit, :debit, :balance

  def initialize(credit, debit, balance)
    @credit = credit
    @balance = balance
    @debit = debit
  end

end
