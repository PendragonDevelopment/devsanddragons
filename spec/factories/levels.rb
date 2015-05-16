# == Schema Information
#
# Table name: levels
#
#  id         :integer          not null, primary key
#  title      :string
#  xp_start   :integer
#  xp_end     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :level do
    title "MyString"
xp_start 1
xp_end 1
  end

end
