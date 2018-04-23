require 'oystercard'

describe Oystercard do
 describe '#balance' do
   it 'should return the balance' do
   expect(subject.balance).to eq 0
end
end

describe '#top_up' do
  it 'should respond to top_up method' do
    expect(subject).to respond_to(:top_up).with(1).argument
  end

  it 'should return correct balance when topped up' do
    expect { subject.top_up(10) }.to change { subject.balance }.by(10)
  end

end

end
