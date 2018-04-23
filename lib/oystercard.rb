class Oystercard
  attr_reader :balance

  MAX_LIMIT = 90

  def initialize
    @balance = 0
  end

  def top_up(amount)
    @amount = amount
    raise "Cannot top up as balance exceeds maximum limit." if max_limit?
    puts "Your total balance is £#{@balance += @amount}."
  end

private

  def max_limit?
    @balance + @amount > MAX_LIMIT
  end

end
