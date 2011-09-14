class RemoveDeployCountFromProjects < ActiveRecord::Migration
  def up
    remove_column :projects, :deploy_count
  end

  def down
    add_column :projects, :deploy_count, :integer, :null => false, :default => 0
  end
end
