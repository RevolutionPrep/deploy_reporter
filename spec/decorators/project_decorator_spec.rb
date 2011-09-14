require 'spec_helper'

describe ProjectDecorator, '.incident_rate_fraction' do

  before(:each) do
    @project_decorator = ProjectDecorator.new(Project.create!(:name => 'Huddle'))
  end

  it "returns a Rational representation of the model's Float incident_rate value" do
    @project_decorator.incident_rate_fraction.should eql(Rational(1, 49))
  end

end

describe ProjectDecorator, '.deploy_rate' do
  
  before(:each) do
    @project_decorator = ProjectDecorator.new(Project.create!(:name => 'Huddle'))
  end
  
  it "returns the model's deploy_rate attribute rounded to 2 decimal points" do
    @project_decorator.deploy_rate.should eql(10.53)
  end
  
end

describe ProjectDecorator, '.deploy_count' do
  
  before(:each) do
    @project = Project.create!(:name => 'Huddle')
    @project_decorator = ProjectDecorator.new(@project)
  end
  
  it "returns the model's deploy_rate attribute rounded to 2 decimal points" do
    @project_decorator.deploy_count.should eql('0 deployments')
    @project.deployments << Deployment.create!(:deployer => 'ryan')
    @project.save
    @project_decorator.deploy_count.should eql('1 deployment')
  end
  
end