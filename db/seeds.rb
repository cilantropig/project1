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

User.create(
    :first_name => 'Chun',
    :last_name => 'He',
    :email => 'che@ncsu.edu',
    :password => 'ruby4all'
)
User.create(
    :first_name => 'Jeremy',
    :last_name => 'Aube',
    :email => 'jkaube@ncsu.edu',
    :password => 'ruby4all'
)
User.create(
    :first_name => 'Aldo',
    :last_name => 'Valenti',
    :email => 'avalent@ncsu.edu',
    :password => 'ruby4all'
)

Post.delete_all
Post.create(
    :title => 'Grading question #1',
    :body => 'lsdkj asdlkjfa sdkjfalksd falskdjf asdkjflkasd falskdjflas lsdkjkljfas dlkjfalksdf alsdkjflasd  lsldjlkjasd lsjdlkfja'
)
Post.create(
    :title => 'Grading question #2',
    :body => 'lsdkj asdlkjfa sdkjfalksd falskdjf asdkjflkasd falskdjflas lsdkjkljfas dlkjfalksdf alsdkjflasd  lsldjlkjasd lsjdlkfja'
)
Post.create(
    :title => 'Ruby question #1',
    :body => 'lsdkj asdlkjfa sdkjfalksd falskdjf asdkjflkasd falskdjflas lsdkjkljfas dlkjfalksdf alsdkjflasd  lsldjlkjasd lsjdlkfja'
)
Post.create(
    :title => 'Ruby question #2',
    :body => 'lsdkj asdlkjfa sdkjfalksd falskdjf asdkjflkasd falskdjflas lsdkjkljfas dlkjfalksdf alsdkjflasd  lsldjlkjasd lsjdlkfja'
)