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
rails = admin1.courses.create!(title: "Intro to Rails", description: "Intro to Rails", completion_xp: 5000)
hartl = rails.campaigns.create(title: "Michael Hartl's Rails Tutorial", description: "Michael Hartl's Rails Tutorial", completion_xp: 2000)
chap1 = hartl.missions.create(title: "Chapter 1", description: "Chapter 1 of Hartl's Rails Tutorial", completion_xp: 100, required: false)
chap2 = hartl.missions.create(title: "Chapter 2", description: "Chapter 2 of Hartl's Rails Tutorial", completion_xp: 100, required: true)
chap3 = hartl.missions.create(title: "Chapter 3", description: "Chapter 3 of Hartl's Rails Tutorial", completion_xp: 100, required: true)
chap31 = chap3.quests.create(title: "Section 3.1", description: "Section 3.1 of Hartl's Rails Tutorial", completion_xp: 25, required: true)
fed = admin2.courses.create!(title: "Intro to Front End Web Development", description: "Intro to Front End Web Development", completion_xp: 5000)
test_user.profile.add_to_course(rails)