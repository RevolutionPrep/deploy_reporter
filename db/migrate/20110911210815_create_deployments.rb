class CreateDeployments < ActiveRecord::Migration
  def change
    create_table :deployments do |t|
      t.timestamps
      t.datetime :deployed_at, :null => false
      t.string   :deployer,    :null => false
      t.text     :description, :null => false, :default => ''
      t.integer  :project_id,  :null => false
    end
    add_index :deployments, :project_id
  end
end
