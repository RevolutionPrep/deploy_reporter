require 'spec_helper'

describe Deployment do
  let(:deployment) { Deployment.create!(:deployer => 'ryan', :deployed_at => DateTime.now) }

  it 'has the right attributes' do
    attributes = [
      :created_at,
      :deployed_at,
      :deployer,
      :description,
      :id,
      :project_id,
      :updated_at
    ]
    Deployment.column_names.sort.map(&:to_sym).should eql(attributes)
  end

  describe 'associations' do

    it { should belong_to(:project) }

  end

  describe 'validations' do

    it { deployment.should validate_presence_of(:deployer) }

    it { deployment.should validate_presence_of(:deployed_at) }

  end

  describe '#project_name' do

    before(:each) do
      @project = Project.create!(:name => 'Huddle')
      deployment.project = @project
    end

    it 'the name of the project that this deployment belongs to' do
      deployment.project_name.should eql('Huddle')
    end

  end

  describe '#project_name=' do

    context 'when the deployment belongs to a project' do

      before(:each) do
        deployment.project = Project.create!(:name => 'Huddle')
      end

      it 'returns the name of the project that this deployment belongs to' do
        deployment.project_name = 'Socrates'
        deployment.project_name.should eql('Socrates')
      end

    end

    context 'when the deployment does not belong to a project' do

      it 'creates a project and names it according to the project_name value given' do
        deployment.project_name = 'Socrates'
        deployment.project_name.should eql('Socrates')
      end

    end

  end

  describe '#deployed_at' do

    it 'specifies the deployed_at value upon creation unless one is specified in the attributes hash' do
      deployment = Deployment.create!(:deployer => 'ryan')
      deployment.deployed_at.should_not be_nil
    end

  end

end
