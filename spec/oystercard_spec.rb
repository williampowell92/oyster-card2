require 'oystercard'

describe Oystercard do
  let(:entry_station) { instance_double Station }
  let(:exit_station) { instance_double Station }
  let(:minimum_charge) { Oystercard::MINIMUM_CHARGE }

  describe '#balance' do
    it 'should return the balance' do
      expect(subject.balance).to eq 0
    end
  end

  describe '#initialise' do
    it 'should have # as an empty hash' do
      expect(subject.journeys).to be_empty
    end
  end

  describe '#top_up' do
    it 'should return correct balance when topped up' do
      expect { subject.top_up(10) }.to change { subject.balance }.by(10)
    end

    it 'should raise error if total exceeds max limit' do
      expect { subject.top_up(100) }.to raise_error("Balance exceeds maximum limit")
    end
  end

  describe '#touch_in' do
    it 'should raise an error message if balance on #touch_in is less than £1' do
      expect { subject.touch_in(entry_station) }.to raise_error 'Insufficient funds for a journey'
    end
  end

  describe '#touch_out' do
    it 'should deduct minimum fare' do
      subject.top_up(minimum_charge)
      subject.touch_in(entry_station)
      expect { subject.touch_out(exit_station) }.to change { subject.balance }.by(-1)
    end

    it 'should store exit_station' do
      subject.top_up(minimum_charge)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.journeys.last.exit_station).to eq exit_station
    end

    it 'should store one journey' do
      subject.top_up(minimum_charge)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.journeys.length).to eq 1
    end
  end
end
