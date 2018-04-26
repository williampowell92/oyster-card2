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

end
