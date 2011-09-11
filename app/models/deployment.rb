class Deployment < ActiveRecord::Base
  belongs_to :project
  validates :deployer,    :presence => true
  validates :description, :presence => true
  validates :deployed_at, :presence => true
end