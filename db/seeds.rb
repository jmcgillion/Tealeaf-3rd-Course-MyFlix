# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

futurama = Video.create(title: "Futurama", description: "This film represents the future", small_cover_url: '/tmp/futurama.jpg')

monk = Video.create(title: "Monk", description: "This film will make you think ..", small_cover_url: "/tmp/monk.jpg", large_cover_url: "/tmp/monk_large.jpg")

south_park = Video.create(title: "South Park", description: "What a fun comedy ...", small_cover_url: "/tmp/south_park.jpg")

family_guy = Video.create(title: "Family Guy", description: "A knee slapping, laugh out loud ...", small_cover_url: "/tmp/family_guy.jpg")

comedies = Category.create(name: "Comedies")

adventure= Category.create(name: "Adventure")







