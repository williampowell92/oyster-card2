MAX_LIMIT = 90
MINIMUM_BALANCE = 1
MINIMUM_CHARGE = 1

class Oystercard
  attr_reader :balance, :entry_station, :exit_station, :list_of_journeys

  def initialize
    @balance = 0
    @list_of_journeys = []
  end

  def top_up(amount)
    raise "Cannot top up as balance exceeds maximum limit." if max_limit?(amount)
    "Your total balance is £#{@balance += amount}."
  end

  def touch_in(station)
    raise 'Insufficient funds for a journey' if balance < MINIMUM_BALANCE
    @entry_station = station.__id__
  end

  def touch_out(station)
    deduct(MINIMUM_CHARGE)
    @exit_station = station.__id__
    @list_of_journeys << { entry_station: @entry_station, exit_station:@exit_station }
    @entry_station = nil
    @exit_station = nil
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
