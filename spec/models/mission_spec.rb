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


require 'rails_helper'

RSpec.describe Mission, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
