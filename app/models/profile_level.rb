# == Schema Information
#
# Table name: profile_levels
#
#  id         :integer          not null, primary key
#  level_id   :integer
#  profile_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_profile_levels_on_level_id    (level_id)
#  index_profile_levels_on_profile_id  (profile_id)
#


class ProfileLevel < ActiveRecord::Base
  belongs_to :level
  belongs_to :profile
end
