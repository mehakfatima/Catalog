# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Adding Roles"
['admin', 'user'].each do |role|
  Role.find_or_create_by({name: role})
end

unless User.find_by_email('admin@techverx.com').present?
	admin_role = Role.find_by_name("admin")  
	# create an Administration user  
  admin_user = User.new({ :email => 'admin@techverx.com', 
              :password => '12345678', 
              :password_confirmation => '12345678'})
  admin_user.skip_confirmation!
  admin_user.save
	admin_user.roles << admin_role
	puts "Admin created....skipping"
else
	puts "Admin exist....skipping"
end