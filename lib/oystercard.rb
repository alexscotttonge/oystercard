class OysterCard

  LIMIT = 90
  FARE = 2

  attr_reader :balance, :entry_station, :exit_station, :journey_history

  def initialize
    @balance = 0
    @entry_station
    @exit_station
    @journey_history = []
  end

  def top_up(amount)
    raise "Can't put more than £#{LIMIT} on card!" if @balance + amount > LIMIT
    @balance += amount
  end

  def touch_in(entry_station)
    raise 'Balance too low!' if @balance <= 1
    @entry_station = entry_station
  end

  def touch_out(exit_station)
    @balance -= FARE
    @exit_station = exit_station
    @journey_history << {entry_station: entry_station, exit_station: exit_station}
    @entry_station = nil
  end

  def in_journey?
    @entry_station != nil
  end

  # def journey_history
  #   history = {}
  #   history[@entry_station] = @exit_station
  #   @j_history << history
  # end

  private

  def deduct(amount)
    @balance -= amount
  end

end

# card = OysterCard.new
# card.top_up(10)
# card.touch_in('Baker St')
# card.touch_out('Hammersmith')
# card.journey_history
