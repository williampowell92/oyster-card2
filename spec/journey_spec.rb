require 'journey'

describe Journey do
  it 'should change journey to start on touch in' do
    expect { subject.start }.to change { subject.started }.to true
  end
  it 'should stop the journey on touch out' do
    subject.start
    expect { subject.stop }.to change { subject.started }.to false
  end
  it 'should return true if journey is complete' do
    subject.start
    subject.stop
    expect(subject.journey_complete?).to eq true
  end
end
