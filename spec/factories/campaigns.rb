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


FactoryGirl.define do
  factory :campaign do
    title "MyString"
description "MyText"
course nil
completion_xp 1
  end

end
