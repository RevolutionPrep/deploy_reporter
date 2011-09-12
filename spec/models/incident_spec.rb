require 'spec_helper'

describe Incident, 'attributes' do

  it 'has an occurred_at attribute' do
    Incident.new.attributes.should include('occurred_at')
  end

  it 'has a time_to_detect attribute' do
    Incident.new.attributes.should include('time_to_detect')
  end

  it 'has a time_to_diagnose attribute' do
    Incident.new.attributes.should include('time_to_diagnose')
  end

  it 'has a time_to_resolve attribute' do
    Incident.new.attributes.should include('time_to_resolve')
  end

  it 'has a had_errors attribute' do
    Incident.new.attributes.should include('had_errors')
  end

  it 'has a required_redeploy attribute' do
    Incident.new.attributes.should include('required_redeploy')
  end

  it 'has a required_rollback attribute' do
    Incident.new.attributes.should include('required_rollback')
  end

  it 'has a noticed_outside_of_development' do
    Incident.new.attributes.should include('noticed_outside_of_development')
  end

  it 'has a required_formal_incident_report attribute' do
    Incident.new.attributes.should include('required_formal_incident_report')
  end

  it 'has a description attribute' do
    Incident.new.attributes.should include('description')
  end

  it 'has a lessons_learned attribute' do
    Incident.new.attributes.should include('lessons_learned')
  end

end

describe Incident, 'validations' do

  it { should validate_presence_of(:occurred_at) }

end