# == Schema Information
#
# Table name: profiles
#
#  id                  :integer          not null, primary key
#  user_id             :integer
#  twitter             :string
#  facebook            :string
#  github              :string
#  xp                  :integer
#  current_title       :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  avatar_file_name    :string
#  avatar_content_type :string
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#  name                :string
#  bio                 :text
#
# Indexes
#
#  index_profiles_on_user_id  (user_id)
#



FactoryGirl.define do
  factory :profile do
    user nil
twitter "MyString"
facebook "MyString"
github "MyString"
xp 1
current_title "MyString"
  end

end
