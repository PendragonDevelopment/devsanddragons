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

FactoryGirl.define do
  factory :profile_quest do
    status 1
profile nil
quest nil
  end

end
