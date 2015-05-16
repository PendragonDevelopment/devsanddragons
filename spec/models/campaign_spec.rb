# == Schema Information
#
# Table name: campaigns
#
#  id            :integer          not null, primary key
#  title         :string
#  description   :text
#  course_id     :integer
#  completion_xp :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_campaigns_on_course_id  (course_id)
#

require 'rails_helper'

RSpec.describe Campaign, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
