class CreateProfileStatuses < ActiveRecord::Migration
  def change
    create_table :profile_statuses do |t|
      t.integer :current_course
      t.integer :current_campaign
      t.integer :current_mission
      t.hstore :completed

      t.timestamps null: false
    end
  end
end
