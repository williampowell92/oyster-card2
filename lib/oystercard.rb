

class Oystercard # creates a class called OysterCard
  MAX_LIMIT = 90 # creates a constant called MAX_LIMIT
  MINIMUM_BALANCE = 1 # creates a constant called MINIMUM_BALANCE
  MINIMUM_CHARGE = 1 # creates a constant called MINIMUM_CHARGE

  attr_reader :balance, :journeys # gives access to balance and journeys

  def initialize # method that runs on instance creation
    @balance = 0 # sets instance variable balance to 0
    @journeys = [] # sets instance variable journeys to []
    @journey = {}
  end

  def top_up(amount) # method that takes one argument
    raise "Cannot top up as balance exceeds maximum limit." if exceeds_limit?(amount) # raises error if amount exceeds card limit
    @balance += amount # increases balance by amount
  end

  def touch_in(entry_station) # method that takes one argument
    raise 'Insufficient funds for a journey' if insufficient_funds? # raises error if insufficient funds
    @journey[:entry_station] = entry_station
  end

  def touch_out(exit_station) # method that takes one argument
    deduct(MINIMUM_CHARGE) # reduces balance by amount
    @journey[:exit_station] = exit_station # sets the exit station in journey to exit station
    save_journey # calls method to save journey hash into journeys array
    reset_journey # resets journey to a new hash
  end

  def in_journey? # method takes no arguments
    !!@journey[:entry_station] && @journey[:exit_station].nil? # returns true if entry station is not nil and exit station is nil
  end

private

  def deduct(amount) # method takes one argument
    @balance -= amount # deducts amount from balance
  end

  def save_journey
    @journeys << @journey # saves the journey into journeys
  end

  def reset_journey
    @journey = {} # resets the journey hash
  end

  def exceeds_limit?(amount)
    @balance + amount > MAX_LIMIT
  end

  def insufficient_funds?
    balance < MINIMUM_BALANCE
  end
end
