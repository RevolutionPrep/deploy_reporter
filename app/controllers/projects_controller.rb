class ProjectsController < ApplicationController

  def index
    @projects = ProjectDecorator.decorate(Project.all)
  end

  def show
    @project = ProjectDecorator.find(params[:id])
  end

end