# == Schema Information
#
# Table name: profile_quests
#
#  id         :integer          not null, primary key
#  status     :integer
#  profile_id :integer
#  quest_id   :integer
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
  after_initialize :set_in_progress

  enum status: [:in_progress, :submitted, :approved]

  def set_in_progress
    self.in_progress!
  end
end
