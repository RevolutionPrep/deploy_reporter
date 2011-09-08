class CreateDeployments < ActiveRecord::Migration
  def change
    create_table :deployments do |t|
      t.timestamps
      t.integer :project_id, :null => false
      t.string :deployer
    end
    add_index :deployments, :project_id
  end
end
