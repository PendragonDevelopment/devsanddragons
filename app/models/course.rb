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

class Course < ActiveRecord::Base
  belongs_to :instructor, class: "User"
  has_many :campaigns, dependent: :destroy
  validates :title, :completion_xp, :instructor_id, presence: :true
end
