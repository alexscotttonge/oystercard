class OysterCard

  LIMIT = 90
  FARE = 2

  attr_reader :balance, :entry_station, :exit_station, :journey_history

  def initialize
    @balance = 0
    @entry_station # this can be removed
    @exit_station # this can be removed
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

  def in_journey? # can remove this so OysterCard.new.exit_station doesn't return nil
    @entry_station != nil
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end

# c = OysterCard.new
# c.top_up(5)
# c.touch_in('bodger st')
# c.touch_out('badger st')
# c.entry_station
# c.exit_station
