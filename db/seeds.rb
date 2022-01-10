# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

gow = Game.create(name: "God of War", platform: "Playstation")

hellblade2 = Game.create(name: "Hellblade 2", platform: "Xbox")

redfall = Game.create(name: "Redfall", platform: "Xbox")

gow.genres.build(name: "Action")
gow.genres.build(name: "Adventure")

hellblade2.genres.build(name: "Horror")
hellblade2.genres.build(name: "Narrative")

redfall.genres.build(name: "Open World")
redfall.genres.build(name: "RPG")

gow.save
hellblade2.save
redfall.save