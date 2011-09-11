require 'spec_helper'

describe ProjectDecorator, '.incident_rate_fraction' do

  before(:each) do
    @project_decorator = ProjectDecorator.new(Project.create!(:name => 'Huddle'))
  end

  it 'returns a Rational representation of the Float incident_rate value' do
    @project_decorator.incident_rate_fraction.should eql(Rational(1, 49))
  end

end