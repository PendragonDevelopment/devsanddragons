# == Schema Information
#
# Table name: courses
#
#  id            :integer          not null, primary key
#  title         :string
#  completion_xp :integer
#  description   :text
#  instructor_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#


FactoryGirl.define do
  factory :course do
    title "MyString"
completion_xp 1
description "MyText"
instructor_id 1
  end

end
