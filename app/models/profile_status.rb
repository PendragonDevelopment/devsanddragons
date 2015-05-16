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
#  current_level     :integer
#
# Indexes
#
#  index_profile_statuses_on_profile_id  (profile_id)
#


class ProfileStatus < ActiveRecord::Base
  belongs_to :profile
  belongs_to :course, foreign_key: "current_course"
  after_initialize :set_default_level

  def set_default_level
    update_attributes!(current_level: Level.first.id)
  end
end
