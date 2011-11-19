require 'spec_helper'

describe DeploymentDecorator do
  let(:deployment) { build(:deployment) }

  describe '#project_name' do

    before(:each) do
      @project = mock_model(Project, :name => 'socrates')
      deployment.project = @project
      @decorator = deployment.decorator
    end

    it "returns the project's name" do
      @decorator.project_name.should eql(@project.name)
    end

  end

  describe '#deployed_at_timestamp' do

    before(:each) do
      deployment.deployed_at = DateTime.parse('2011-01-01T16:32:00-08:00')
      @decorator  = DeploymentDecorator.new(deployment)
    end

    it "returns a timestamp string version of the deployment's deployed_at value" do
      @decorator.deployed_at_timestamp.should eql('4:32PM')
    end

  end

  describe '#description_summary' do

    before(:each) do
      deployment.description = 'Deploying some fixes to the exam grading infrastructure that was long past due.'
      @decorator  = DeploymentDecorator.new(deployment)
    end

    it "returns a string version of the deployment's description shortened to 25 characters" do
      @decorator.description_summary.should eql('Deploying some fixes to t')
    end

  end

  describe '#deployed_at_as_date' do

    before(:each) do
      deployment.deployed_at = DateTime.parse('2011-01-01T16:32:00-08:00')
      @decorator  = DeploymentDecorator.new(deployment)
    end

    it "returns a Date version of the deployment's deployed_at value" do
      @decorator.deployed_at_as_date.should eql(DateTime.parse('2011-01-01'))
    end

  end

end
