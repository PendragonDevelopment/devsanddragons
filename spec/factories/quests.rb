# == Schema Information
#
# Table name: quests
#
#  id                    :integer          not null, primary key
#  title                 :string
#  description           :text
#  completion_xp         :integer
#  mission_id            :integer
#  required              :boolean
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  comparison_url        :string
#  bonus_xp              :integer
#  comparison_percentage :float
#
# Indexes
#
#  index_quests_on_mission_id  (mission_id)
#

FactoryGirl.define do
  factory :quest do
    title "MyString"
description "MyText"
completion_xp 1
mission nil
required false
  end

end
