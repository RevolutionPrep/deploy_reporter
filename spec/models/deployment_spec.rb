require 'spec_helper'

describe Deployment, 'attributes' do

  it 'has a deployer attribute' do
    Deployment.new.attributes.should include('deployer')
  end

  it 'has a description attribute' do
    Deployment.new.attributes.should include('description')
  end

  it 'has a deployed_at attribute' do
    Deployment.new.attributes.should include('deployed_at')
  end

end

describe Deployment, 'associations' do

  it { should belong_to(:project) }

end

describe Deployment, 'validations' do

  it { should validate_presence_of(:deployer) }

  it { should validate_presence_of(:description) }

  it { should validate_presence_of(:deployed_at) }

end