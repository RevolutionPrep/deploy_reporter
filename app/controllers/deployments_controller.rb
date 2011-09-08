class DeploymentsController < ApplicationController

  def index
    @project = Project.find(params[:project_id])
    @deployments = @project.deployments
  end

end