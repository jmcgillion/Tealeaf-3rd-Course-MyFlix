# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

comedies = Category.create(name: "Comedies")

adventure= Category.create(name: "Adventure")

futurama = Video.create(title: "Futurama", description: "This film represents the future", small_cover_url: '/tmp/futurama.jpg', category_id: 2)

monk = Video.create(title: "Monk", description: "This film will make you think ..", small_cover_url: "/tmp/monk.jpg", large_cover_url: "/tmp/monk_large.jpg", category_id: 2)

south_park = Video.create(title: "South Park", description: "What a fun comedy ...", small_cover_url: "/tmp/south_park.jpg", category_id: 1)

family_guy = Video.create(title: "Family Guy", description: "A knee slapping, laugh out loud ...", small_cover_url: "/tmp/family_guy.jpg", category_id: 1)

south_park = Video.create(title: "South Park", description: "What a fun comedy ...", small_cover_url: "/tmp/south_park.jpg", category_id: 1)

family_guy = Video.create(title: "Family Guy", description: "A knee slapping, laugh out loud ...", small_cover_url: "/tmp/family_guy.jpg", category_id: 1)

south_park = Video.create(title: "South Park", description: "What a fun comedy ...", small_cover_url: "/tmp/south_park.jpg", category_id: 1)

family_guy = Video.create(title: "Family Guy", description: "A knee slapping, laugh out loud ...", small_cover_url: "/tmp/family_guy.jpg", category_id: 1)

south_park = Video.create(title: "South Park", description: "What a fun comedy ...", small_cover_url: "/tmp/south_park.jpg", category_id: 1)

family_guy = Video.create(title: "Family Guy", description: "A knee slapping, laugh out loud ...", small_cover_url: "/tmp/family_guy.jpg", category_id: 1)

kevin = User.create(full_name: "Kevin Moran", email: "kevin@example.com", password: "password")

john = User.create(full_name: "John McGillion", email: "john.r.mcgillion@gmail.com", password: "Whitey415")

Review.create(content: "hoopla", video: monk, user: kevin, rating: 5)
Review.create(content: "boopla", video: monk, user: kevin, rating: 4)

QueueItem.create(video:family_guy, user: john)

QueueItem.create(video: south_park, user: john)





















