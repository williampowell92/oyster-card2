

class Oystercard # creates a class called OysterCard
  MAX_LIMIT = 90 # creates a constant called MAX_LIMIT
  MINIMUM_BALANCE = 1 # creates a constant called MINIMUM_BALANCE
  MINIMUM_CHARGE = 1 # creates a constant called MINIMUM_CHARGE

  attr_reader :balance, :journeys # gives access to balance and journeys

  def initialize # method that runs on instance creation
    @balance = 0 # sets instance variable balance to 0
    @journeys = [] # sets instance variable journeys to []
  end

  def top_up(amount) # method that takes one argument
    raise "Cannot top up as balance exceeds maximum limit." if exceeds_limit?(amount) # raises error if amount exceeds card limit
    @balance += amount # increases balance by amount
  end

  def touch_in(entry_station) # method that takes one argument
    raise 'Insufficient funds for a journey' if insufficient_funds? #
    @entry_station = entry_station
  end

  def touch_out(exit_station)
    deduct(MINIMUM_CHARGE)
    @journeys << { @entry_station => exit_station }
    @entry_station = nil
  end

  def in_journey?
      !@entry_station.nil?
  end

private

  def deduct(amount)
    "Your total balance is £#{@balance -= amount}"
  end

  def exceeds_limit?(amount)
    @balance + amount > MAX_LIMIT
  end

  def insufficient_funds?
    balance < MINIMUM_BALANCE
  end
end
