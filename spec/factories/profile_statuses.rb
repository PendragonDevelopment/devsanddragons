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
#

FactoryGirl.define do
  factory :profile_status do
    current_course 1
current_campaigns ""
current_missions ""
completed ""
  end

end
