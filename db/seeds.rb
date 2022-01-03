# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Song.find_or_create_by!(artist: "Iron & Wine", title: "Passing Afternoon") do |song|
  song.queue_position = (Song.minimum(:queue_position) || 1) - 1
  song.recording = Recording.create!(url: "https://www.youtube.com/watch?v=5LhtxcRCSp8")
end

User.find_or_create_by!(email: "ian@iancanderson.com", admin: true)
