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

# User.create!(first_name: "Test", last_name: "Account 1", email: "1testaccount@gmail.com", password: "yOGM19!OFA4K", admin: true)
# User.create!(first_name: "Test", last_name: "Account 2", email: "2testaccount@gmail.com", password: "3#KH5h@k3fu9", admin: true)
# User.create!(first_name: "Test", last_name: "Account 3", email: "3testaccount@gmail.com", password: "85Iy30Zd^$7F", admin: true)
# User.create!(first_name: "Test", last_name: "Account 4", email: "4testaccount@gmail.com", password: "0nc1e!y#!M3L", admin: true)
# User.create!(first_name: "Test", last_name: "Account 5", email: "5testaccount@gmail.com", password: "hK6C%08kQ3b!", admin: true)
# User.create!(first_name: "Test", last_name: "Account 6", email: "6testaccount@gmail.com", password: "o*K$e441rn4B", admin: true)
# User.create!(first_name: "Test", last_name: "Account 7", email: "7testaccount@gmail.com", password: "3x@36STO52&z", admin: true)
# User.create!(first_name: "Test", last_name: "Account 8", email: "8testaccount@gmail.com", password: "yRY!vk1hHl60", admin: true)
# User.create!(first_name: "Test", last_name: "Account 9", email: "9testaccount@gmail.com", password: "c93wV*xQ$693", admin: true)
# User.create!(first_name: "Test", last_name: "Account 10", email: "10testaccount@gmail.com", password: "KdP36O0Tc@XK", admin: true)
# User.create!(first_name: "Test", last_name: "Account 11", email: "11testaccount@gmail.com", password: "nGxa09tO3#6m", admin: true)
# User.create!(first_name: "Test", last_name: "Account 12", email: "12testaccount@gmail.com", password: "105A4hkR*gse", admin: true)
# User.create!(first_name: "Test", last_name: "Account 13", email: "13testaccount@gmail.com", password: "0MV4vFm^Z@x8", admin: true)
# User.create!(first_name: "Test", last_name: "Account 14", email: "14testaccount@gmail.com", password: "5t@m8YPn6J7p", admin: true)
# User.create!(first_name: "Test", last_name: "Account 15", email: "15testaccount@gmail.com", password: "@xfM7Ymh277c", admin: true)
# User.create!(first_name: "Test", last_name: "Account 16", email: "16testaccount@gmail.com", password: "rT3M55388%Pw", admin: true)
# User.create!(first_name: "Test", last_name: "Account 17", email: "17testaccount@gmail.com", password: "x@N3$d61O05M", admin: true)
# User.create!(first_name: "Test", last_name: "Account 18", email: "18testaccount@gmail.com", password: "wjDIao769*jY", admin: true)
# User.create!(first_name: "Test", last_name: "Account 19", email: "19testaccount@gmail.com", password: "*10q0GY^C69m", admin: true)
# User.create!(first_name: "Test", last_name: "Account 20", email: "20testaccount@gmail.com", password: "D1@EI0V4u25P", admin: true)
# User.create!(first_name: "Test", last_name: "Account 21", email: "21testaccount@gmail.com", password: "DS6B0M!lhT7d", admin: true)
# User.create!(first_name: "Test", last_name: "Account 22", email: "22testaccount@gmail.com", password: "1eyvQm1#cFn3", admin: true)
# User.create!(first_name: "Test", last_name: "Account 23", email: "23testaccount@gmail.com", password: "unuZ3%16J14F", admin: true)
# User.create!(first_name: "Test", last_name: "Account 24", email: "24testaccount@gmail.com", password: "Cdrf06F90!7Z", admin: true)
# User.create!(first_name: "Test", last_name: "Account 25", email: "25testaccount@gmail.com", password: "*f3fFs13f^p8", admin: true)
# User.create!(first_name: "Test", last_name: "Account 26", email: "26testaccount@gmail.com", password: "98$Gx1ryYEf&", admin: true)
# User.create!(first_name: "Test", last_name: "Account 27", email: "27testaccount@gmail.com", password: "mV3u6aJ@889T", admin: true)
# User.create!(first_name: "Test", last_name: "Account 28", email: "28testaccount@gmail.com", password: "V4o4W2^34m5^", admin: true)