require 'oystercard'

describe Oystercard do
  let(:oystercard) { Oystercard.new }

 describe '#balance' do
   it 'should return the balance' do
   expect(oystercard.balance).to eq 0
   end
end

describe '#top_up' do
  it 'should return correct balance when topped up' do
    expect { oystercard.top_up(10) }.to change { oystercard.balance }.by(10)
  end

  it 'should raise error if total exceeds max limit' do
    expect { oystercard.top_up(100) }.to raise_error("Cannot top up as balance exceeds maximum limit.")
  end
end

describe '#deduct' do
  it 'should deduct an amount from our balance and return correct amount' do
    subject.instance_variable_set(:@balance, 20)
    expect { subject.deduct(10) }.to change { subject.balance }.by(-10)
  end
end

describe '#touch_in' do
  it 'should change in_journey? on touch_in' do
    expect { subject.touch_in }.to change { subject.in_journey? }
  end
end

describe '#in_journey?' do
  it 'should respond to in_journey' do
    expect(subject).to respond_to(:in_journey?)
  end
end

describe '#touch_out' do
  it 'should change in_journey? on touch_out' do
    subject.touch_in
    expect { subject.touch_out }.to change { subject.in_journey? }
  end
end
end
