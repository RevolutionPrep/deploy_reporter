class EnforceNameOnProjectWithUniqueIndex < ActiveRecord::Migration
  def up
    add_index :projects, :name, :unique => true
  end

  def down
    remove_index :projects, :name
  end
end
