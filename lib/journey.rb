class Journey
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

  private

  def complete_journey
    @complete = true
  end

end
