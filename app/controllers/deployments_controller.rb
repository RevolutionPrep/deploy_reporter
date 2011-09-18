class DeploymentsController < ApplicationController

  def index
    @deployments = DeploymentDecorator.decorate(Deployment.all)
  end

  def show
    @deployment = DeploymentDecorator.find(params[:id])
  end

  def create
    @deployment = Deployment.create!(params[:deployment])
    render :nothing => true
  end

end