# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Seeding user"
user = User.find_or_create_by(email: "ihera2@uillinois.edu", username: "ian") do |u|
  u.password = "password"
end

puts "Did it work? #{user.persisted?}"
