# == Schema Information
#
# Table name: quests
#
#  id            :integer          not null, primary key
#  title         :string
#  description   :text
#  completion_xp :integer
#  mission_id    :integer
#  required      :boolean
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_quests_on_mission_id  (mission_id)
#

class Quest < ActiveRecord::Base
  belongs_to :mission
end
