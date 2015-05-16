class CreateProfileQuests < ActiveRecord::Migration
  def change
    create_table :profile_quests do |t|
      t.references :profile, index: true, foreign_key: true
      t.references :quest, index: true, foreign_key: true
      t.integer :status

      t.timestamps null: false
    end
  end
end
