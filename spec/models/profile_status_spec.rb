# == Schema Information
#
# Table name: profile_statuses
#
#  id               :integer          not null, primary key
#  current_course   :integer
#  current_campaign :integer
#  current_mission  :integer
#  completed        :hstore
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'rails_helper'

RSpec.describe ProfileStatus, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
