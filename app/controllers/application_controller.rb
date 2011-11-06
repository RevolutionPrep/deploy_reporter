class ApplicationController < ActionController::Base
  protect_from_forgery

  def home
    @projects = Project.all
  end

end
