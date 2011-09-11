class Project < ActiveRecord::Base
  has_many :deployments
  validates :name, :presence => true

  def deploy_rate
    10.526
  end

  def incident_rate
    0.0203
  end

end