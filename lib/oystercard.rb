MAX_LIMIT = 90

class Oystercard
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(amount)
    raise "Cannot top up as balance exceeds maximum limit." if max_limit?(amount)
    "Your total balance is £#{@balance += amount}."
  end

  def deduct(amount)
    "Your total balance is £#{@balance -= amount}"
  end

private

  def max_limit?(amount)
    @balance + amount > MAX_LIMIT
  end
end
