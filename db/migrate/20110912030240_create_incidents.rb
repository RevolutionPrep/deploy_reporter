class CreateIncidents < ActiveRecord::Migration
  def change
    create_table :incidents do |t|
      t.timestamps
      t.datetime :occurred_at,                     :null => false
      t.integer  :time_to_detect
      t.integer  :time_to_diagnose
      t.integer  :time_to_resolve
      t.boolean  :had_errors,                      :null => false, :default => false
      t.boolean  :required_redeploy,               :null => false, :default => false
      t.boolean  :required_rollback,               :null => false, :default => false
      t.boolean  :noticed_outside_of_development,  :null => false, :default => false
      t.boolean  :required_formal_incident_report, :null => false, :default => false
      t.text     :description,                     :null => false, :default => ''
      t.text     :lessons_learned,                 :null => false, :default => ''
    end
  end
end