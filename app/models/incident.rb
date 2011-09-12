class Incident < ActiveRecord::Base
  validates :occurred_at, :presence => true
end