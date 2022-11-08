# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
DeepWell.delete_all
Client.delete_all
Island.delete_all
AuditLog.delete_all
Island.create!(island_name: "Luzon")	
Island.create!(island_name: "Visayas")	
Island.create!(island_name: "Mindanao")	
