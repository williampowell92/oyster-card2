class Oystercard
  attr_reader :balance

  MAX_LIMIT = 90

  def initialize
    @balance = 0
  end

  def top_up(amount)
    raise "Cannot top up as balance exceeds maximum limit." if @balance + amount > MAX_LIMIT
    @balance += amount
  end

end
