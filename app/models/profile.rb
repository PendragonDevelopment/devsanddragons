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
#
# Indexes
#
#  index_profiles_on_user_id  (user_id)
#

class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :profile_levels, dependent: :destroy
  has_many :levels, through: :profile_levels
  has_many :profile_quests, dependent: :destroy
  has_many :quests, through: :profile_quests

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
