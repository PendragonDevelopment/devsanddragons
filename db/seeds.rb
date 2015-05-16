admin1 = User.create(name: "Jordan Burke", email: "jordan@getvitaminc.com", password: "changeme", password_confirmation: "changeme", role: "admin")
admin2 = User.create(name: "Sean Reid", email: "sean@torchcodelab.com", password: "changeme", password_confirmation: "changeme", role: "admin")
user = User.create(name: "Wedge Antilles", email: "pendragondevelopment@gmail.com", password: "changeme", password_confirmation: "changeme")
puts "Users created: "
User.all.each {|user| puts user.name }
admin1.courses.create!(title: "Intro to Rails", description: "Intro to Rails", completion_xp: 5000)
admin2.courses.create!(title: "Intro to Front End Web Development", description: "Intro to Front End Web Development", completion_xp: 5000)
user.profile.profile_status.current_course = Course.first.id