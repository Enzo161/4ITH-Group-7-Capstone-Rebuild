DeepWell.delete_all
Client.delete_all
Region.delete_all
Island.delete_all
AuditLog.delete_all
User.delete_all

# Islands
Island.create!(island_name: "Luzon")
Island.create!(island_name: "Visayas")
Island.create!(island_name: "Mindanao")

# Regions of Luzon
Region.create!(region_name: "Region I", island_id: Island.find_by(island_name: "Luzon").id)
Region.create!(region_name: "Region II", island_id: Island.find_by(island_name: "Luzon").id)
Region.create!(region_name: "Region III", island_id: Island.find_by(island_name: "Luzon").id)
Region.create!(region_name: "Region IV-A", island_id: Island.find_by(island_name: "Luzon").id)
Region.create!(region_name: "Region V", island_id: Island.find_by(island_name: "Luzon").id)
Region.create!(region_name: "CAR", island_id: Island.find_by(island_name: "Luzon").id)
Region.create!(region_name: "NCR", island_id: Island.find_by(island_name: "Luzon").id)
Region.create!(region_name: "Mimaropa", island_id: Island.find_by(island_name: "Luzon").id)

# Regions of Visayas
Region.create!(region_name: "Region VI", island_id: Island.find_by(island_name: "Visayas").id)
Region.create!(region_name: "Region VII", island_id: Island.find_by(island_name: "Visayas").id)
Region.create!(region_name: "Region VIII", island_id: Island.find_by(island_name: "Visayas").id)

# Regions of Mindanao
Region.create!(region_name: "Region IX", island_id: Island.find_by(island_name: "Mindanao").id)
Region.create!(region_name: "Region X", island_id: Island.find_by(island_name: "Mindanao").id)
Region.create!(region_name: "Region XI", island_id: Island.find_by(island_name: "Mindanao").id)
Region.create!(region_name: "Region XII", island_id: Island.find_by(island_name: "Mindanao").id)
Region.create!(region_name: "Region XIII", island_id: Island.find_by(island_name: "Mindanao").id)
Region.create!(region_name: "BARMM", island_id: Island.find_by(island_name: "Mindanao").id)

# Clients
Client.create!(client_name: "Coca Cola", region_id: Region.find_by(region_name: "Region III").id)

# Users
User.create!(first_name: "Lorenzo", last_name: "Plantilla", email: "lorenzoplantilla@gmail.com", password: "Kahitano16!", role: "super admin")
User.create!(first_name: "Sophia Nicole", last_name: "Plantilla", email: "sophianicoleloste@gmail.com", password: "Kahitano16!", role: "admin")
User.create!(first_name: "Stefano", last_name: "San Buenaventura", email: "stefano@gmail.com", password: "Kahitano16!", role: "user")
User.create!(first_name: "Neidine", last_name: "Bernabe", email: "neidine@gmail.com", password: "Kahitano16!", role: "user")

# For panel
User.create!(first_name: "Panel", last_name: "One", email: "panel_one@gmail.com", password: "Password123!", role: "admin")
User.create!(first_name: "Panel", last_name: "Two", email: "panel_two@gmail.com", password: "Password123!", role: "admin")
User.create!(first_name: "Panel", last_name: "Three", email: "panel_three@gmail.com", password: "Password123!", role: "admin")

# Log for initializing system
AuditLog.create!(event: "Data Seed", modifier: "System", table_name: "-", object_name: "-", date_created: Date.today, counter: 1)