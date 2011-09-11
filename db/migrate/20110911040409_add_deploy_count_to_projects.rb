class AddDeployCountToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :deploy_count, :integer, :default => 0, :null => false
  end
end
