# == Schema Information
#
# Table name: missions
#
#  id            :integer          not null, primary key
#  campaign_id   :integer
#  title         :string
#  description   :text
#  completion_xp :integer
#  required      :boolean
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_missions_on_campaign_id  (campaign_id)
#


FactoryGirl.define do
  factory :mission do
    campaign nil
title "MyString"
description "MyText"
completion_xp 1
required false
  end

end
