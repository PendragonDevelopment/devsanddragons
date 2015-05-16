Level.create!(xp_start: 0, xp_end: 100)
49.times do
  level = Level.create!
end
admin1 = User.create(name: "Jordan Burke", email: "jordan@getvitaminc.com", password: "changeme", password_confirmation: "changeme", role: "admin")
admin2 = User.create(name: "Sean Reid", email: "sean@torchcodelab.com", password: "changeme", password_confirmation: "changeme", role: "admin")
test_user = User.create(name: "Wedge Antilles", email: "pendragondevelopment@gmail.com", password: "changeme", password_confirmation: "changeme")
puts "Users created: "
User.all.each {|user| puts user.name }
admin1.courses.create!(title: "Intro to Rails", description: "Intro to Rails", completion_xp: 5000)
admin2.courses.create!(title: "Intro to Front End Web Development", description: "Intro to Front End Web Development", completion_xp: 5000)
test_user.profile.profile_status.update_attributes!(current_course: Course.first.id)