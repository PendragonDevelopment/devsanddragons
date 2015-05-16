class CreateLevels < ActiveRecord::Migration
  def change
    create_table :levels do |t|
      t.string :title
      t.integer :xp_start
      t.integer :xp_end

      t.timestamps null: false
    end
  end
end
