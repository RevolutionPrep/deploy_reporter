class DeploymentDecorator < ApplicationDecorator
  decorates :deployment

  def project_name
    project.name
  end

  def deployed_at_timestamp
    deployed_at.strftime("%l:%M%p").strip
  end

  def description_summary
    description.slice(0,25)
  end

end