MAX_LIMIT = 90
MINIMUM_BALANCE = 1
MINIMUM_CHARGE = 1

class Oystercard
  attr_reader :balance, :entry_station

  def initialize
    @balance = 0
  end

  def top_up(amount)
    raise "Cannot top up as balance exceeds maximum limit." if max_limit?(amount)
    "Your total balance is £#{@balance += amount}."
  end

  def touch_in(station)
    raise 'Insufficient funds for a journey' if balance < MINIMUM_BALANCE
    @entry_station = station.__id__
  end

  def touch_out
    deduct(MINIMUM_CHARGE)
    @entry_station = nil
  end

  def in_journey?
      !@entry_station.nil?
  end

private

  def deduct(amount)
    "Your total balance is £#{@balance -= amount}"
  end

  def max_limit?(amount)
    @balance + amount > MAX_LIMIT
  end
end
