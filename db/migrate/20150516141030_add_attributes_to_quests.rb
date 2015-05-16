class AddAttributesToQuests < ActiveRecord::Migration
  def change
    add_column :quests, :comparison_url, :string
    add_column :quests, :bonus_xp, :integer
    add_column :quests, :comparison_percentage, :float
  end
end
