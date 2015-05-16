class AddReferenceToProfileStatus < ActiveRecord::Migration
  def change
    add_reference :profile_statuses, :profile, index: true, foreign_key: true
  end
end
