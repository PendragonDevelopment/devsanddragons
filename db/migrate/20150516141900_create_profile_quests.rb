class CreateProfileQuests < ActiveRecord::Migration
  def change
    create_table :profile_quests do |t|
      t.integer :status
      t.references :profile, index: true, foreign_key: true
      t.references :quest, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
