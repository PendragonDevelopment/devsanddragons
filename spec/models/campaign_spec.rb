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


require 'rails_helper'

RSpec.describe Campaign, type: :model do
  before(:each) {@campaign = Campaign.new(title: "Hartl's Rails Tutorial", completion_xp: 2500)}

  subject { @campaign }

  it { should respond_to(:title) }

  it "has #completion_xp" do
    expect(@campaign.completion_xp * 1).to eq(@campaign.completion_xp)
  end
end
