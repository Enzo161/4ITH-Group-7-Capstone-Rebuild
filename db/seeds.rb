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


# # User.create!(first_name: "Lorenzo", last_name: "Plantilla", email: "lorenzoplantilla@gmail.com", password: "Kahitano16!", role: "super admin")
# # User.create!(first_name: "Sophia Nicole", last_name: "Plantilla", email: "sophianicoleloste@gmail.com", password: "Kahitano16!", role: "admin")
# # User.create!(first_name: "Test", last_name: "Account 1", email: "1testaccount@gmail.com", password: "Kahitano16!", role: "user")
# # User.create!(first_name: "Test", last_name: "Account 2", email: "2testaccount@gmail.com", password: "Kahitano16!", role: "user")
# # User.create!(first_name: "Test", last_name: "Account 3", email: "3testaccount@gmail.com", password: "Kahitano16!", role: "user")
# # User.create!(first_name: "Test", last_name: "Account 4", email: "4testaccount@gmail.com", password: "Kahitano16!", role: "user")
# # User.create!(first_name: "Test", last_name: "Account 5", email: "5testaccount@gmail.com", password: "Kahitano16!", role: "user")
# # User.create!(first_name: "Test", last_name: "Account 6", email: "6testaccount@gmail.com", password: "Kahitano16!", role: "user")
# # User.create!(first_name: "Test", last_name: "Account 7", email: "7testaccount@gmail.com", password: "Kahitano16!", role: "user")
# # User.create!(first_name: "Test", last_name: "Account 8", email: "8testaccount@gmail.com", password: "Kahitano16!", role: "user")
# # User.create!(first_name: "Test", last_name: "Account 9", email: "9testaccount@gmail.com", password: "Kahitano16!", role: "user")
# User.create!(first_name: "Test", last_name: "Account 10", email: "10testaccount@gmail.com", password: "KdP36O0Tc@XK", role: "admin")
# User.create!(first_name: "Test", last_name: "Account 11", email: "11testaccount@gmail.com", password: "nGxa09tO3#6m", role: "admin")
# User.create!(first_name: "Test", last_name: "Account 12", email: "12testaccount@gmail.com", password: "105A4hkR*gse", role: "admin")
# User.create!(first_name: "Test", last_name: "Account 13", email: "13testaccount@gmail.com", password: "0MV4vFm^Z@x8", role: "admin")
# User.create!(first_name: "Test", last_name: "Account 14", email: "14testaccount@gmail.com", password: "5t@m8YPn6J7p", role: "admin")
# User.create!(first_name: "Test", last_name: "Account 15", email: "15testaccount@gmail.com", password: "@xfM7Ymh277c", role: "super admin")
# User.create!(first_name: "Test", last_name: "Account 16", email: "16testaccount@gmail.com", password: "rT3M55388%Pw", role: "super admin")
# User.create!(first_name: "Test", last_name: "Account 17", email: "17testaccount@gmail.com", password: "x@N3$d61O05M", role: "super admin")
# User.create!(first_name: "Test", last_name: "Account 18", email: "18testaccount@gmail.com", password: "wjDIao769*jY", role: "super admin")
# User.create!(first_name: "Test", last_name: "Account 19", email: "19testaccount@gmail.com", password: "*10q0GY^C69m", role: "super admin")
# User.create!(first_name: "Test", last_name: "Account 20", email: "20testaccount@gmail.com", password: "D1@EI0V4u25P", role: "super admin")
# User.create!(first_name: "Test", last_name: "Account 21", email: "21testaccount@gmail.com", password: "DS6B0M!lhT7d", role: "super admin")
# User.create!(first_name: "Test", last_name: "Account 22", email: "22testaccount@gmail.com", password: "1eyvQm1#cFn3", role: "super admin")
# User.create!(first_name: "Test", last_name: "Account 23", email: "23testaccount@gmail.com", password: "unuZ3%16J14F", role: "super admin")
# User.create!(first_name: "Test", last_name: "Account 24", email: "24testaccount@gmail.com", password: "Cdrf06F90!7Z", role: "super admin")
# User.create!(first_name: "Test", last_name: "Account 25", email: "25testaccount@gmail.com", password: "*f3fFs13f^p8", role: "super admin")
# User.create!(first_name: "Test", last_name: "Account 26", email: "26testaccount@gmail.com", password: "98$Gx1ryYEf&", role: "super admin")
# User.create!(first_name: "Test", last_name: "Account 27", email: "27testaccount@gmail.com", password: "mV3u6aJ@889T", role: "super admin")
# User.create!(first_name: "Test", last_name: "Account 28", email: "28testaccount@gmail.com", password: "V4o4W2^34m5^", role: "super admin")