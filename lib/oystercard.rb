class OysterCard

  LIMIT = 90
  FARE = 2

  attr_reader :balance, :entry_station

  def initialize
    @balance = 0
    # @in_journey = false
    @entry_station
  end

  def top_up(amount)
    raise "Can't put more than £#{LIMIT} on card!" if @balance + amount > LIMIT
    @balance += amount
  end

  def touch_in(entry_station)
    raise 'Balance too low!' if @balance <= 1
    # @in_journey = true
    @entry_station = entry_station
  end

  def touch_out
    @balance -= FARE
    # @in_journey = false
    @entry_station = nil
  end

  def in_journey?
    @entry_station != nil
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end


card = OysterCard.new
card.balance
