require 'journey'

class Oystercard
  MAX_LIMIT = 90
  MINIMUM_CHARGE = 1

  attr_reader :balance, :journeys

  def initialize
    @balance = 0
    @journeys = []
  end

  def top_up(amount)
    raise "Cannot top up as balance exceeds maximum limit." if exceeds_limit?(amount)
    @balance += amount
  end

  def touch_in(entry_station)
    raise 'Insufficient funds for a journey' if insufficient_funds?
    @journey = Journey.new
    @journey.start(entry_station)
  end

  def touch_out(exit_station)
    deduct(MINIMUM_CHARGE)
    @journey.finish(exit_station)
    save_journey
  end

private

  def deduct(amount)
    @balance -= amount
  end

  def save_journey
    @journeys << @journey
  end

  def exceeds_limit?(amount)
    @balance + amount > MAX_LIMIT
  end

  def insufficient_funds?
    balance < MINIMUM_CHARGE
  end
end
