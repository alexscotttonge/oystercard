require 'oystercard'

describe OysterCard do
  describe '#initialize' do
    it 'creates a balance of zero' do
      expect(subject.balance).to eq 0
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

end
