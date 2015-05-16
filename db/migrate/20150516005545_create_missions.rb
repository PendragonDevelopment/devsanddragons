class CreateMissions < ActiveRecord::Migration
  def change
    create_table :missions do |t|
      t.references :campaign, index: true, foreign_key: true
      t.string :title
      t.text :description
      t.integer :completion_xp
      t.boolean :required

      t.timestamps null: false
    end
  end
end
