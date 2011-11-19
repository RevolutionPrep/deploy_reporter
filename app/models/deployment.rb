class Deployment < ActiveRecord::Base
  belongs_to :project
  validates :deployer,    :presence => true
  validates :deployed_at, :presence => true

  before_validation(:on => :create) do
    self.deployed_at ||= DateTime.now.utc
  end

  def project_name
    project.name
  end

  def project_name=(project_name)
    if project
      project.name = project_name
    else
      self.project = Project.find_or_create_by_name(project_name)
    end
  end

  def deployed_on
    deployed_at.to_date
  end

end
