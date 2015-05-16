Level.create!(xp_start: 0, xp_end: 100)
49.times do
  Level.create!
end
admin1 = User.create(email: "jordan@getvitaminc.com", password: "changeme", password_confirmation: "changeme", role: "admin")
admin1.profile.update_attributes!(name: "Jordan Burke")
admin2 = User.create(email: "sean@torchcodelab.com", password: "changeme", password_confirmation: "changeme", role: "admin")
admin2.profile.update_attributes!(name: "Sean Reid")
test_user = User.create(email: "pendragondevelopment@gmail.com", password: "changeme", password_confirmation: "changeme")
test_user.profile.update_attributes!(name: "Wedge Antilles")
puts "Users created: "
User.all.each {|user| puts user.profile.name }
admin1.courses.create!(title: "Intro to Rails", description: "Intro to Rails", completion_xp: 5000)
admin2.courses.create!(title: "Intro to Front End Web Development", description: "Intro to Front End Web Development", completion_xp: 5000)
test_user.profile.profile_status.update_attributes!(current_course: Course.first.id)