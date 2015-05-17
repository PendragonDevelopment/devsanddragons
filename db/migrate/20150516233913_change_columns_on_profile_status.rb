class ChangeColumnsOnProfileStatus < ActiveRecord::Migration
  def self.up
    remove_column :profile_statuses, :current_campaigns
    remove_column :profile_statuses, :current_missions
    add_column :profile_statuses, :current_campaigns, :string, array: true, default: []
    add_column :profile_statuses, :current_missions, :string, array: true, default: []
  end

  def self.down
    remove_column :profile_statuses, :current_campaigns
    remove_column :profile_statuses, :current_missions
    add_column :profile_statuses, :current_campaigns, :hstore
    add_column :profile_statuses, :current_missions, :hstore
  end
end
