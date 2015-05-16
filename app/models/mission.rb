# == Schema Information
#
# Table name: missions
#
#  id            :integer          not null, primary key
#  campaign_id   :integer
#  title         :string
#  description   :text
#  completion_xp :integer
#  required      :boolean
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_missions_on_campaign_id  (campaign_id)
#


class Mission < ActiveRecord::Base
  belongs_to :campaign
  has_many :quests, dependent: :destroy

  def required_quests
    self.quests.where(required: true)
  end

  def completed?
    required_quests
  end
end
