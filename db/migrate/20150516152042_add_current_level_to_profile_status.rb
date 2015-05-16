class AddCurrentLevelToProfileStatus < ActiveRecord::Migration
  def change
    add_column :profile_statuses, :current_level, :integer
  end
end
