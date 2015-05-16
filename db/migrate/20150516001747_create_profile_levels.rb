class CreateProfileLevels < ActiveRecord::Migration
  def change
    create_table :profile_levels do |t|
      t.references :level, index: true, foreign_key: true
      t.references :profile, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
