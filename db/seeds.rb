# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
MeetupEvent.delete_all
Time.zone = 'Moscow'
first =  DateTime.new(2018,4, 22, 11, 0).in_time_zone(Time.zone)
time = first
10.times do
  MeetupEvent.create!(start_time: time)
  time = time + 4.weeks
end