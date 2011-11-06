require 'spec_helper'

describe 'deployments#create' do

  context 'when no projects or deployments exist' do

    it 'creates a deployment and a project' do
      post '/deployments', { :deployment => { :deployer => 'ryan', :project_name => 'Huddle' } }
      Deployment.count.should eql(1)
      deployment = Deployment.first
      deployment.deployer.should eql('ryan')
      deployment.project.name.should eql('Huddle')
      deployment.project.deploy_count.should eql(1)
    end

  end

  context 'when a project exists, but no deployments exist' do

    before(:each) do
      Project.create!(:name => 'Huddle')
    end

    it 'creates a deployment for the existing project' do
      post '/deployments', { :deployment => { :deployer => 'ryan', :project_name => 'Huddle' } }
      Deployment.count.should eql(1)
      deployment = Deployment.first
      deployment.deployer.should eql('ryan')
      deployment.project.name.should eql('Huddle')
      deployment.project.deploy_count.should eql(1)
    end

  end

end
