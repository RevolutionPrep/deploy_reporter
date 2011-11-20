class DeploymentsController < ApplicationController

  before_filter :load_project, :only => :index

  def index
    @deployments = Deployment.includes(:project)
    @deployments = @deployments.where(:project_id => @project.id) if @project
    @deployments = DeploymentDecorator.decorate(@deployments)
  end

  def show
    @deployment = DeploymentDecorator.find(params[:id])
  end

  def create
    @deployment = Deployment.create!(params[:deployment])
    render :nothing => true
  end

  protected

  def load_project
    @project = Project.find(params[:project_id]) if params[:project_id]
  end

end
