class IncidentsController < ApplicationController

  def index
    @incidents = IncidentDecorator.decorate(Incident.all)
  end

end