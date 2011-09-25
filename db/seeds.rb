# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
admin=User.create(first_name: 'First', last_name: 'Last', email: 'admin@glq.com', password: 'ruby4all')
admin.update_attribute :admin, true
