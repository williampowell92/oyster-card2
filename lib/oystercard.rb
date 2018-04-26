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
    raise "Balance exceeds maximum limit" if exceeds_limit?(amount)
    @balance += amount
  end

  def touch_in(entry_station, journey = Journey.new)
    raise 'Insufficient funds for a journey' if insufficient_funds?
    create_journey(journey)
    @journey.start(entry_station)
  end

  def touch_out(exit_station, journey = Journey.new)
    create_journey(journey) if no_journey?
    @journey.finish(exit_station)
    deduct(@journey.fare)
    save_journey
    reset_journey
  end

private

  def deduct(amount)
    @balance -= amount
  end

  def save_journey
    @journeys << @journey
  end

  def reset_journey
    @journey = nil
  end

  def exceeds_limit?(amount)
    @balance + amount > MAX_LIMIT
  end

  def insufficient_funds?
    balance < MINIMUM_CHARGE
  end

  def create_journey(journey)
    @journey = journey
  end

  def no_journey?
    @journey.nil?
  end
end
