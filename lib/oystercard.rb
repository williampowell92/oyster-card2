MAX_LIMIT = 90

class Oystercard
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(amount)
    @addition = amount
    raise "Cannot top up as balance exceeds maximum limit." if max_limit?
    "Your total balance is £#{@balance += @addition}."
  end

  def deduct(amount)
    @deduction = amount
    raise "Cannot travel. Insufficent funds." if min_limit?
    "Your total balance is £#{@balance -= @deduction}"
  end

private

  def max_limit?
    @balance + @addition > MAX_LIMIT
  end

  def min_limit?
    @balance - @deduction < 0
  end

end
