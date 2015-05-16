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
  has_one  :profile_status, dependent: :destroy

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def current_quests
    profile_quests.in_progress
  end

  def set_default_title
    self.current_title ||= "Developer Initiate"
  end

  def complete_mission(id)
    profile_status.completed[:missions] << id
  end

  def complete_campaign(id)
    profile_status.completed[:campaigns] << id
  end

  def complete_course(id)
    profile_status.completed[:courses] << id
  end
end
