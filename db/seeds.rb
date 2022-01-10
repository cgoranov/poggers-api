# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

gow = Game.create(name: "God of War", platform: "Playstation")

hellblade = Game.create(name: "Hellblade", platform: "Xbox")

hellblade.comments.build(content: "difficult achievements")
hellblade.comments.build(content: "available on Xbox game pass!")

gow.comments.build(content: "game fo the year, and easy platinum")

gow.save
hellblade.save