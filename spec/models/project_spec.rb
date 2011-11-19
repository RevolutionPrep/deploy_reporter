require 'spec_helper'

describe Project do
  let(:project) { create(:project) }

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

    context 'when the project has deployments' do

      before(:each) do
        3.times do
          project.deployments << create(:deployment, :deployed_at => DateTime.now)
        end
        5.times do
          project.deployments << create(:deployment, :deployed_at => DateTime.now + 1.day)
        end
        1.times do
          project.deployments << create(:deployment, :deployed_at => DateTime.now + 2.days)
        end
        3.times do
          project.deployments << create(:deployment, :deployed_at => DateTime.now + 3.days)
        end
        4.times do
          project.deployments << create(:deployment, :deployed_at => DateTime.now + 4.days)
        end
        project.save!
      end

      it 'returns a float value representing the number of deploys per day over the life of the project' do
        project.deploy_rate.should be_within(0.05).of(3.2)
      end

    end

    context 'when the project has no deployments' do

      it 'returns 0.0' do
        project.deploy_rate.should eql(0.0)
      end

    end

  end

  describe '#incident_rate' do

    it 'returns a float value representing the number of incidents against the number of deploys' do
      project.incident_rate.should be_within(0.001).of(0.02)
    end

  end

  describe '#deploy_count' do

    it 'gets incremented when a new deployment is added to the project' do
      project.deployments << create(:deployment)
      project.save
      project.deploy_count.should eql(1)
    end

  end

end
