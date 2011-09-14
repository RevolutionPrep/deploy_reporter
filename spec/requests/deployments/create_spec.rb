require 'spec_helper'

describe 'deployments#create' do

  it 'creates a deployment' do
    post '/deployments', { :deployment => { :deployer => 'ryan', :project_name => 'Huddle' } }
    Deployment.count.should eql(1)
    deployment = Deployment.first
    deployment.deployer.should eql('ryan')
    deployment.project.name.should eql('Huddle')
    deployment.project.deploy_count.should eql(1)
  end

end