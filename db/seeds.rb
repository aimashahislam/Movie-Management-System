# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create!(email: 'aima.shah@square63.com', password: '123456', password_confirmation: '123456', name: 'Aima Shah', gender: 'female', date_of_birth: DateTime.strptime("11/03/1994 17:00", "%m/%d/%Y %H:%M"), phone_no: '03214324324', admin: true)
