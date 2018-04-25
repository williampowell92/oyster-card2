class Journey

attr_reader :started

  def initialize
    @started = false
  end

  def start
    @started = true
  end

  def stop
    @started = false
  end

  def journey_complete?
    @started == false
  end

end
