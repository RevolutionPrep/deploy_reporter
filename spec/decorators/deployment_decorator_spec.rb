require 'spec_helper'

describe DeploymentDecorator, '.project_name' do

  before(:each) do
    @project = mock_model(Project, :name => 'Socrates')
    @deployment = Deployment.new(:project => @project)
    @deployment_decorator = DeploymentDecorator.new(@deployment)
  end

  it "returns the project's name" do
    @deployment_decorator.project_name.should eql(@project.name)
  end

end

describe DeploymentDecorator, '.deployed_at_timestamp' do

  before(:each) do
    @deployment = Deployment.new(:deployed_at => DateTime.parse('2011-01-01T16:32:00-08:00'))
    @deployment_decorator = DeploymentDecorator.new(@deployment)
  end

  it "returns a timestamp string version of the deployment's deployed_at value" do
    @deployment_decorator.deployed_at_timestamp.should eql('4:32PM')
  end

end

describe DeploymentDecorator, '.description_summary' do

  before(:each) do
    @deployment = Deployment.new(:description => 'Deploying some fixes to the exam grading infrastructure that was long past due.')
    @deployment_decorator = DeploymentDecorator.new(@deployment)
  end

  it "returns a string version of the deployment's description shortened to 25 characters" do
    @deployment_decorator.description_summary.should eql('Deploying some fixes to t')
  end

end

describe DeploymentDecorator, '.deployed_at_as_date' do

  before(:each) do
    @deployment = Deployment.new(:deployed_at => DateTime.parse('2011-01-01T16:32:00-08:00'))
    @deployment_decorator = DeploymentDecorator.new(@deployment)
  end

  it "returns a Date version of the deployment's deployed_at value" do
    @deployment_decorator.deployed_at_as_date.should eql(DateTime.parse('2011-01-01'))
  end

end