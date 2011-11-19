class ProjectDecorator < ApplicationDecorator
  decorates :project

  def deploy_count
    h.pluralize(model.deploy_count, 'deployment')
  end

  def deploy_rate
    model.deploy_rate.round(2)
  end

  def incident_rate_fraction
    num, den = incident_rate.to_fraction(100)
    Rational(num, den)
  end

end
