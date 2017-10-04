class OysterCard

  LIMIT = 90

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(amount)
    raise "Can't put more than £#{LIMIT} on card!" if @balance + amount > LIMIT
    @balance += amount
  end

end
