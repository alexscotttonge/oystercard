require 'oystercard'

describe OysterCard do

  let(:entry_station) {double :entry_station}

  describe '#initialize' do
    it 'creates a balance of zero' do
      expect(subject.balance).to eq 0
    end

    it "is not in use" do
      expect(subject.in_journey?).to be false
    end

    it "has been touched in" do
      subject.top_up(10)
      subject.touch_in(1)
      expect(subject.in_journey?).to be true
    end

    it "has been touched out" do
      subject.touch_out
      expect(subject.in_journey?).to be false
    end
  end

  describe '#balance' do
    it "raises error if balance is less than £1" do
      expect{subject.touch_in(1)}.to raise_error "Balance too low!"
    end

    it 'reduces balance by minimum fare' do
      fare = OysterCard::FARE
      subject.top_up(10)
      subject.touch_in(1)
      expect{subject.touch_out}.to change{subject.balance}.by -fare
    end
  end

  describe '#top_up' do
    it 'tops up balance' do
      previous_balance = subject.balance
      expect(subject.top_up(10)).to eq previous_balance + 10
    end

    it 'throws error when balance is greater than 90' do
      limit = OysterCard::LIMIT
      subject.top_up(limit)
      expect{subject.top_up(1)}.to raise_error "Can't put more than £#{limit} on card!"
    end
  end

  it 'remembers the current entry station' do
    subject.top_up(5)
    subject.touch_in(entry_station)
    expect(subject.entry_station).to eq entry_station
  end
end
