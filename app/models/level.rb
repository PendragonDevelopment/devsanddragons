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


class Level < ActiveRecord::Base
  has_many :profile_levels, dependent: :destroy
  has_many :profiles, through: :profile_levels

  def previous_level
    id > 1 ? Level.find(id - 1) : "You can't regress more that that!"
  end

  def next_level
    id < Level.count ? Level.find(id + 1) : "Level capped!"
  end
end
