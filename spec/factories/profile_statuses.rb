# == Schema Information
#
# Table name: profile_statuses
#
#  id                :integer          not null, primary key
#  current_course    :integer
#  completed         :hstore
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  profile_id        :integer
#  current_level     :integer
#  current_campaigns :string           default([]), is an Array
#  current_missions  :string           default([]), is an Array
#
# Indexes
#
#  index_profile_statuses_on_profile_id  (profile_id)
#



FactoryGirl.define do
  factory :profile_status do
    current_course 1
current_campaigns ""
current_missions ""
completed ""
  end

end
