MAX_LIMIT = 90
MINIMUM_BALANCE = 1

class Oystercard
  attr_reader :balance

  def initialize
    @balance = 0
    @in_route = false
  end

  def top_up(amount)
    raise "Cannot top up as balance exceeds maximum limit." if max_limit?(amount)
    "Your total balance is £#{@balance += amount}."
  end

  def deduct(amount)
    "Your total balance is £#{@balance -= amount}"
  end

  def touch_in
    raise 'Insufficient funds for a journey' if balance < MINIMUM_BALANCE
    @in_route = true
  end

  def touch_out
    @in_route = false
  end

  def in_journey?
    @in_route
  end

private

  def max_limit?(amount)
    @balance + amount > MAX_LIMIT
  end
end
