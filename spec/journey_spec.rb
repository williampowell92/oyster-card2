require 'journey'

describe Journey do
  let(:entry_station) { instance_double Station  }
  let(:exit_station) { instance_double Station }

  describe '#start' do
    it 'should change value of entry_station to entry_station' do
      expect { subject.start(entry_station) }.to change { subject.entry_station }.to entry_station
    end
  end

  describe '#finish' do
    it 'should change value of exit_station to exit_station' do
      expect { subject.finish(exit_station) }.to change { subject.exit_station }.to exit_station
    end
  end

  describe '#complete?' do
    it 'should return false until a journey is started' do
      expect(subject).not_to be_complete
    end

    it 'should return true when a journey has finished' do
      subject.start(entry_station)
      subject.finish(exit_station)
      expect(subject).to be_complete
    end
  end

  describe '#fare' do
    it 'should return minimum fare if there are entry and exit stations' do
      subject.start(entry_station)
      subject.finish(exit_station)
      expect(subject.fare).to eq described_class::MINIMUM_FARE
    end

    it 'should return penalty fare if there is just an entry station' do
      subject.start(entry_station)
      expect(subject.fare).to eq described_class::PENALTY_FARE
    end

    it 'should return penalty fare if there is just an exit station' do
      subject.finish(exit_station)
      expect(subject.fare).to eq described_class::PENALTY_FARE
    end
  end
end
