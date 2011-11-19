require 'spec_helper'

describe ProjectDecorator do
  let(:project) { Project.new(:name => 'Huddle') }

  describe '#incident_rate_fraction' do

    before(:each) do
      @decorator = project.decorator
    end

    it "returns a Rational representation of the model's Float incident_rate value" do
      @decorator.incident_rate_fraction.should eql(Rational(1, 49))
    end

  end

  describe '#deploy_rate' do

    before(:each) do
      @decorator = project.decorator
    end

    it "returns the model's deploy_rate attribute rounded to 2 decimal points" do
      @decorator.deploy_rate.should eql(10.53)
    end

  end

  describe '.deploy_count' do

    before(:each) do
      @decorator = project.decorator
    end

    it "returns the model's deploy_rate attribute rounded to 2 decimal points" do
      @decorator.deploy_count.should eql('0 deployments')
      project.deployments << Deployment.create!(:deployer => 'ryan')
      project.save
      @decorator.deploy_count.should eql('1 deployment')
    end

  end

end
