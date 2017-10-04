class OysterCard

  LIMIT = 90

  attr_reader :balance, :in_journey

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    raise "Can't put more than £#{LIMIT} on card!" if @balance + amount > LIMIT
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    raise 'Balance too low!' if @balance <= 1
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

end
