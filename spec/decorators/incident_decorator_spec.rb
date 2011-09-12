require 'spec_helper'

describe IncidentDecorator, '.occurred_at_timestamp' do

  before(:each) do
    @incident = Incident.new(:occurred_at => DateTime.parse('2011-01-01T21:00:00Z'))
    @incident_decorator = IncidentDecorator.new(@incident)
  end

  it "returns a string timestamp representation of the incident's occurred_at value" do
    @incident_decorator.occurred_at_timestamp.should eql('9:00PM')
  end

end

describe IncidentDecorator, '.time_to_detect_in_words' do

  before(:each) do
    @incident = Incident.new(:time_to_detect => 2)
    @incident_decorator = IncidentDecorator.new(@incident)
  end

  it 'returns a wordy version of the time_to_detect value' do
    @incident_decorator.time_to_detect_in_words.should eql('2m')
  end

end

describe IncidentDecorator, '.time_to_diagnose_in_words' do
  
  before(:each) do
    @incident = Incident.new(:time_to_diagnose => 4)
    @incident_decorator = IncidentDecorator.new(@incident)
  end

  it 'returns a wordy version of the time_to_diagnose value' do
    @incident_decorator.time_to_diagnose_in_words.should eql('4m')
  end
  
end

describe IncidentDecorator, '.time_to_resolve_in_words' do
  
  before(:each) do
    @incident = Incident.new(:time_to_resolve => 6)
    @incident_decorator = IncidentDecorator.new(@incident)
  end

  it 'returns a wordy version of the time_to_resolve value' do
    @incident_decorator.time_to_resolve_in_words.should eql('6m')
  end
  
end