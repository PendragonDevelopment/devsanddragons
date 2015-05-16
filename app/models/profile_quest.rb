# == Schema Information
#
# Table name: profile_quests
#
#  id         :integer          not null, primary key
#  profile_id :integer
#  quest_id   :integer
#  status     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_profile_quests_on_profile_id  (profile_id)
#  index_profile_quests_on_quest_id    (quest_id)
#

class ProfileQuest < ActiveRecord::Base
  belongs_to :profile
  belongs_to :quest

  enum status: [:inactive, :in_progress, :completed]
end
