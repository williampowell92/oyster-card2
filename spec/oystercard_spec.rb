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

describe '#touch_in' do
  it 'should change in_journey? on touch_in' do
    subject.instance_variable_set(:@balance, 20)
    expect { subject.touch_in }.to change { subject.in_journey? }
  end
  it 'should raise an error message if balance on #touch_in is less than £1' do
    expect { subject.touch_in }. to raise_error 'Insufficient funds for a journey'
  end
end

describe '#touch_out' do
  it 'should change in_journey? on touch_out' do
    subject.instance_variable_set(:@balance, 20)
    subject.touch_in
    expect { subject.touch_out }.to change { subject.in_journey? }
  end

  it 'should deduct minimum fare upon #touch_out' do
    expect { subject.touch_out }.to change { subject.balance }.by(-1)
  end
end
end
