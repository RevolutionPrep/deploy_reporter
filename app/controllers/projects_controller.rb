class ProjectsController < ApplicationController

  def show
    @project = ProjectDecorator.find(params[:id])
  end

end