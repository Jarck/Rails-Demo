# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "seed start"

ApplicationRecord.connection.execute("SET FOREIGN_KEY_CHECKS=0")
ApplicationRecord.connection.execute("TRUNCATE users")
ApplicationRecord.connection.execute("TRUNCATE topics")
ApplicationRecord.connection.execute("SET FOREIGN_KEY_CHECKS=1")

User.create!([
  {email: 'test@test.com', name: 'test', password: '12345678', password_confirmation: '12345678'}
])

user = User.last

user.topics.create!([
  {title: 'Test 1', body: 'test', body_html: '<p>test 1</p>'},
  {title: 'Test 2', body: 'test', body_html: '<p>test 2</p>'},
  {title: 'Test 3', body: 'test', body_html: '<p>test 3</p>'},
  {title: 'Test 4', body: 'test', body_html: '<p>test 4</p>'},
  {title: 'Test 5', body: 'test', body_html: '<p>test 5</p>'}
])

puts "seed end"