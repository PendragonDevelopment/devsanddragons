class MoveNameFromUserToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :name, :string
    remove_column :users, :name
  end
end
