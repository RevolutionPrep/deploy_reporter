require 'spec_helper'

describe Project do
  let(:project) { Project.create!(:name => 'Test') }

  it 'has the right attributes' do
    attributes = [
      :created_at,
      :id,
      :name,
      :updated_at
    ]
    Project.column_names.sort.map(&:to_sym).should eql(attributes)
  end

  describe 'validations' do

    it { should validate_presence_of(:name) }

    it { project.should validate_uniqueness_of(:name) }

  end

  describe 'associations' do

    it { should have_many(:deployments) }

  end

  describe '#deploy_rate' do

    it 'returns a float value representing the number of deploys per day over the life of the project' do
      project.deploy_rate.should be_within(0.05).of(10.526)
    end

  end

  describe '#incident_rate' do

    it 'returns a float value representing the number of incidents against the number of deploys' do
      project.incident_rate.should be_within(0.001).of(0.02)
    end

  end

  describe '#deploy_count' do

    it 'gets incremented when a new deployment is added to the project' do
      project.deployments << Deployment.create!(:deployer => 'ryan')
      project.save
      project.deploy_count.should eql(1)
    end

  end

end
