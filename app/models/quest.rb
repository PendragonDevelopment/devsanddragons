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


class Quest < ActiveRecord::Base
  belongs_to :mission
  has_many :profile_quests, dependent: :destroy
  has_many :profiles, through: :profile_quests
end
