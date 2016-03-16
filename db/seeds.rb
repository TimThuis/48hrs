# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Booking.destroy_all
Tour.destroy_all
Review.destroy_all

puts "create user"

quoc = User.create!(email: "q@email.com", password: "12345678", guide: true, first_name: "Quoc", last_name: "Bui", birthday: "1990-11-02", picture_url: "https://unsplash.it/200/200/", street: "Vondelparklaan 22", zipcode: "1234 AB", city: "Amsterdam", phone:"+31 6 1234 5678", bio: "This is me", hour_rate: 10)
tim = User.create!(email: "tim@email.com", password: "12345678", guide: false, first_name: "Tim", last_name: "Thuis", phone:"+31 6 1234 5678")

puts "create booking"

# first_booking = Booking.create!(user:, tour:, date:, check_in:, check_out:, status:, total_price:, hour_rate:)
puts "create tour"

# first_tour = Tour.create!(user: tim, category: "sport")
puts "create review"

# first_review = Review.create!(content: "Hello this is my first review", rating: 5)

puts "users, booking, tour, review created!"


