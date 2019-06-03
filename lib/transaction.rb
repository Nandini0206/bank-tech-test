class Transaction

  attr_reader :credit, :debit, :balance, :date

  def initialize(credit, debit, balance)
    @credit = credit
    @balance = balance
    @debit = debit
    @date = Time.now
  end

end
