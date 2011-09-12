# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110912030240) do

  create_table "deployments", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deployed_at",                 :null => false
    t.string   "deployer",                    :null => false
    t.text     "description", :default => "", :null => false
    t.integer  "project_id",                  :null => false
  end

  add_index "deployments", ["project_id"], :name => "index_deployments_on_project_id"

  create_table "incidents", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "occurred_at",                                        :null => false
    t.integer  "time_to_detect"
    t.integer  "time_to_diagnose"
    t.integer  "time_to_resolve"
    t.boolean  "had_errors",                      :default => false, :null => false
    t.boolean  "required_redeploy",               :default => false, :null => false
    t.boolean  "required_rollback",               :default => false, :null => false
    t.boolean  "noticed_outside_of_development",  :default => false, :null => false
    t.boolean  "required_formal_incident_report", :default => false, :null => false
    t.text     "description",                     :default => "",    :null => false
    t.text     "lessons_learned",                 :default => "",    :null => false
  end

  create_table "projects", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "deploy_count", :default => 0, :null => false
  end

end
