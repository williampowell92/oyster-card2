class Journey
  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  attr_reader :entry_station, :exit_station

  def initialize
    @complete = false
  end

  def start(entry_station)
    @entry_station = entry_station
  end

  def finish(exit_station)
    @exit_station = exit_station
    complete_journey
  end

  def complete?
    @complete
  end

  def fare
    return PENALTY_FARE if no_entry_station? || no_exit_station?
    MINIMUM_FARE
  end

  private

  def complete_journey
    @complete = true
  end

  def no_exit_station?
    @exit_station.nil?
  end

  def no_entry_station?
    @entry_station.nil?
  end

end
