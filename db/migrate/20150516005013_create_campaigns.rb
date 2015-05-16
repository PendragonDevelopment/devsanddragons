class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :title
      t.text :description
      t.references :course, index: true, foreign_key: true
      t.integer :completion_xp

      t.timestamps null: false
    end
  end
end
