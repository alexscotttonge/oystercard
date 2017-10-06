require 'station'

describe Station do

  subject (:station) { Station.new }

  it 'knows its name' do
    expect(station.name).to eq 'Stamford Brook'
  end

  it 'knows its zone' do
    expect(station.zone).to eq 2
  end
end
