require 'spec_helper'

describe Project, 'attributes' do

  it 'has a name attribute' do
    Project.new.attributes.should include('name')
  end

end

describe Project, 'validations' do

  it { should validate_presence_of(:name) }

end

describe Project, 'associations' do

  it { should have_many(:deployments) }

end

describe Project, '.deploy_rate' do

  before(:each) do
    @project = Project.create!(:name => 'Huddle')
  end

  it 'returns a float value representing the number of deploys per day over the life of the project' do
    @project.deploy_rate.should be_within(0.05).of(10.526)
  end

end

describe Project, '.incident_rate' do

  before(:each) do
    @project = Project.create!(:name => 'Huddle')
  end

  it 'returns a float value representing the number of incidents against the number of deploys' do
    @project.incident_rate.should be_within(0.001).of(0.02)
  end

end

describe Project, '.deploy_count' do

  before(:each) do
    @project = Project.create!(:name => 'Huddle')
  end

  it 'gets incremented when a new deployment is added to the project' do
    @project.deployments << Deployment.create!(:deployer => 'ryan')
    @project.save
    @project.deploy_count.should eql(1)
  end

end