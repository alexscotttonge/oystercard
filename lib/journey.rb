class Journey

  # attr_reader :entry_station

  def initialize
    @journey_history = []
    @journeys = {}
  end

  def start_journey(entry_station)
    journeys = { entry_station: entry_station }
  end

  # def end_journey(exit_station)
  #   journeys = { exit_station: exit_station }
  #   journey_history << journeys

end
