class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title
      t.integer :completion_xp
      t.text :description
      t.integer :instructor_id

      t.timestamps null: false
    end
  end
end
