require 'spec_helper'

describe Project, 'attributes' do
  
  it 'should have a name attribute' do
    Project.new.attributes.should include('name')
  end
  
end

describe Project, 'validations' do
  
  it { should validate_presence_of(:name) }
  
end