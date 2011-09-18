class DeploymentDecorator < ApplicationDecorator
  decorates :deployment

  def project_name
    project.name
  end

  def deployed_at_timestamp(format = :time)
    case format
    when :time
      deployed_at.strftime("%l:%M%p").strip
    when :date
      deployed_at.strftime("%D")
    when :weekday
      deployed_at.strftime("%A")
    when :full
      "#{deployed_at_timestamp(:weekday)}, #{deployed_at_timestamp(:date)} @ #{deployed_at_timestamp(:time)}"
    else
      deployed_at
    end
  end

  def description_summary
    description.slice(0,25)
  end

end