class ChangeProjectIdConstraintsOnDeployments < ActiveRecord::Migration
  def up
    change_column :deployments, :project_id, :integer, :null => true
  end

  def down
    change_column :deployments, :project_id, :integer, :null => false
  end
end
