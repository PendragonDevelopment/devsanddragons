class CreateQuests < ActiveRecord::Migration
  def change
    create_table :quests do |t|
      t.string :title
      t.text :description
      t.integer :completion_xp
      t.references :mission, index: true, foreign_key: true
      t.boolean :required

      t.timestamps null: false
    end
  end
end
