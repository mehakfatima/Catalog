# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Role.delete_all
puts "Adding Roles"
['admin','user'].each do |r|
  @role = Role.new
  @role.name = r
  @role.save
end

unless User.find_by_email('admin@techverx.com').present?
	# create a role named "admin"
	admin_role = Role.find_by_name("admin")
	# create an admin user
	admin_user = User.create!(:email => "admin@techverx.com", :password => "12345678")
	admin_user.roles << admin_role

	puts "Admin created....skipping"

else
	puts "Admin exist....skipping"
end
