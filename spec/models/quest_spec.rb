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


require 'rails_helper'

RSpec.describe Quest, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
