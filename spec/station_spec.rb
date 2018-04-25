require 'station'

describe Station do
  let(:station) { Station.new("Baker Street", 1) }

  it 'should return the zone the station is in' do
    expect(station.zone).to eq 1
  end
  it 'should return the name of the station' do
    expect(station.name).to eq "Baker Street"
  end
end
