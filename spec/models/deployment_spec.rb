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

  before(:each) do
    @deployment = Deployment.create!(:deployer => 'ryan', :deployed_at => DateTime.now)
  end

  it { @deployment.should validate_presence_of(:deployer) }

  it { @deployment.should validate_presence_of(:deployed_at) }

end

describe Deployment, '.project_name' do

  before(:each) do
    @project = Project.create!(:name => 'Huddle')
    @deployment = Deployment.new(:project => @project)
  end

  it 'the name of the project that this deployment belongs to' do
    @deployment.project_name.should eql('Huddle')
  end

end

describe Deployment, '.project_name=' do

  before(:each) do
    @deployment = Deployment.create!(:deployer => 'ryan', :deployed_at => DateTime.now)
  end

  context 'when the deployment belongs to a project' do
    
    before(:each) do
      @deployment.project = Project.create!(:name => 'Huddle')
    end

    it 'returns the name of the project that this deployment belongs to' do
      @deployment.project_name = 'Socrates'
      @deployment.project_name.should eql('Socrates')
    end

  end
  
  context 'when the deployment does not belong to a project' do

    it 'creates a project and names it according to the project_name value given' do
      @deployment.project_name = 'Socrates'
      @deployment.project_name.should eql('Socrates')
    end

  end

end

describe Deployment, '.deployed_at' do
  
  it 'specifies the deployed_at value upon creation unless one is specified in the attributes hash' do
    deployment = Deployment.create!(:deployer => 'ryan')
    deployment.deployed_at.should_not be_nil
  end
  
end