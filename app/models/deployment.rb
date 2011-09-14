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
      create_project!(:name => project_name)
    end
  end

end