require 'journey'

# it has started a journey
# describe: start_journey is a boolean method returning true/false

# it has finished a journey
# describe: finish_journey is a boolean method returning true/false

describe Journey do

  let(:journey) { Journey.new }

  let(:entry_station)  { double (:entry_station) }

  # let(:journeys) {:entry_station entry_station}

  it 'adds an entry station to the journeys hash' do
    expect(journey.start_journey(entry_station)). to eq({entry_station: entry_station })
  end

end
