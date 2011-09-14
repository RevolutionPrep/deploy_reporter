class DeploymentsController < ApplicationController

  def index
    @deployments = DeploymentDecorator.decorate(Deployment.all)
  end

  def create
    @deployment = Deployment.create!(params[:deployment])
    render :nothing => true
  end

end