class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.references :user, index: true, foreign_key: true
      t.string :twitter
      t.string :facebook
      t.string :github
      t.integer :xp
      t.string :current_title

      t.timestamps null: false
    end
  end
end
