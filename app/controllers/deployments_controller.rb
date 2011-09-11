class DeploymentsController < ApplicationController

  def index
    @deployments = DeploymentDecorator.decorate(Deployment.all)
  end

end