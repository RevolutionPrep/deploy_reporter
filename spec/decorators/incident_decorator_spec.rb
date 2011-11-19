require 'spec_helper'

describe IncidentDecorator do
  let(:incident) { build(:incident) }

  describe '#occurred_at_timestamp' do

    before(:each) do
      incident.occurred_at = DateTime.parse('2011-01-01T21:00:00-08:00')
      @decorator = incident.decorator
    end

    it "returns a string timestamp representation of the incident's occurred_at value" do
      @decorator.occurred_at_timestamp.should eql('9:00PM')
    end

  end

  describe '#time_to_detect_in_words' do

    before(:each) do
      incident.time_to_detect = 2
      @decorator = incident.decorator
    end

    it 'returns a wordy version of the time_to_detect value' do
      @decorator.time_to_detect_in_words.should eql('2m')
    end

  end

  describe '#time_to_diagnose_in_words' do

    before(:each) do
      incident.time_to_diagnose = 4
      @decorator = incident.decorator
    end

    it 'returns a wordy version of the time_to_diagnose value' do
      @decorator.time_to_diagnose_in_words.should eql('4m')
    end

  end

  describe '#time_to_resolve_in_words' do

    before(:each) do
      incident.time_to_resolve = 6
      @decorator = incident.decorator
    end

    it 'returns a wordy version of the time_to_resolve value' do
      @decorator.time_to_resolve_in_words.should eql('6m')
    end

  end

end
