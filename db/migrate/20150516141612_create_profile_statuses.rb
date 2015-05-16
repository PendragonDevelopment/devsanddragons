class CreateProfileStatuses < ActiveRecord::Migration
  def change
    create_table :profile_statuses do |t|
      t.integer :current_course
      t.hstore :current_campaigns
      t.hstore :current_missions
      t.hstore :completed

      t.timestamps null: false
    end
  end
end
