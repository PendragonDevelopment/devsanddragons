# == Schema Information
#
# Table name: profile_statuses
#
#  id                :integer          not null, primary key
#  current_course    :integer
#  current_campaigns :hstore
#  current_missions  :hstore
#  completed         :hstore
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  profile_id        :integer
#
# Indexes
#
#  index_profile_statuses_on_profile_id  (profile_id)
#

require 'rails_helper'

RSpec.describe ProfileStatus, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
