require 'journey'

describe Journey do

  let(:entry_station) { instance_double Station  }
  let(:exit_station) { instance_double Station }
  xit 'should change journey to start on touch in' do
    expect { subject.start }.to change { subject.started }.to true
  end

  xit 'should stop the journey on touch out' do
    subject.start
    expect { subject.stop }.to change { subject.started }.to false
  end

  xit 'should return true if journey is complete' do
    subject.start
    subject.stop
    expect(subject.journey_complete?).to eq true
  end

  it 'should respond to entry_station' do
    expect(subject).to respond_to(:entry_station)
  end

  it 'should respond to exit_station' do
    expect(subject).to respond_to(:exit_station)
  end

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
