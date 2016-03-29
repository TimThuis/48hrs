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
Category.destroy_all

require "faker"


puts "create user"
# Guides
quoc = User.create!(email: "q@email.com", password: "12345678", guide: true, first_name: "Quoc", last_name: "Bui", \
birthday: "1990-11-02", photo: "", street: "Vondelparklaan 22", zipcode: "1234 AB", city: "Amsterdam", \
phone:"+31 6 1234 5678", bio: "This is Q", hour_rate: 10, rating: 3)

blane = User.create!(email: "blane@email.com", password: "12345678", guide: true, first_name: "Blane", last_name: "Matsardji", \
birthday: "1992-05-21", photo: "", street: "De pijp 100", zipcode: "1234 AB", city: "Amsterdam", \
phone:"+31 6 1234 5678", bio: "This is Blane", hour_rate: 15, rating: 4)

sjors = User.create!(email: "sjors@email.com", password: "12345678", guide: true, first_name: "Sjors", last_name: Faker::Name.last_name, \
birthday: "2000-01-01", photo: "http://res.cloudinary.com/timthuis/image/upload/v1459235351/guide_1_nb6izt.jpg", street: Faker::Address.street_address, zipcode: Faker::Address.zip_code, city: Faker::Address.city_prefix, \
phone:Faker::PhoneNumber.cell_phone, bio: "This is Sjors", hour_rate: Faker::Number.between(6, 20), rating: Faker::Number.between(1, 5))


# Visitor
tim = User.create!(email: "tim@email.com", password: "12345678", guide: false, first_name: "Tim", last_name: "Thuis", phone:"+31 6 1234 5678", photo: "")
andre = User.create!(email: "andre@email.com", password: "12345678", guide: false, first_name: "Andre", last_name: "de Vries", phone:"+31 6 1234 5678", photo: "")
####

puts "create category"

active = Category.create!(name: "Active", description: "Action", photo:"")
party = Category.create!(name: "Party", description: "Dancing", photo:"")
food = Category.create!(name: "Food", description: "Eating", photo:"")
bar = Category.create!(name: "Bar", description: "Drinking with friends", photo:"")
cultural = Category.create!(name: "Cultural", description: "Do some sightseeing", photo:"")
shopping = Category.create!(name: "Shopping", description: "Do some sightseeing", photo:"")


####

puts "create tour"

first_tour = Tour.create!(user: quoc, category: active, description: "Sport!")
second_tour = Tour.create!(user: quoc, category: party, description: "Party!")
thirth_tour = Tour.create!(user: blane, category: food, description: "Food!")
fourth_tour = Tour.create!(user: blane, category: cultural, description: "Cultural!")

####

puts "create booking"

first_booking = Booking.create!(visitor: tim, guide: quoc, tour: first_tour, date:"2016-1-1", check_in:"", check_out:"", status:"pending", total_price: 0, hour_rate: 0)
second_booking = Booking.create!(visitor: tim, guide: quoc, tour: second_tour, date:"2016-1-1", check_in:"", check_out:"", status:"cancel", total_price: 0, hour_rate: 0)
thirth_booking = Booking.create!(visitor: andre, guide: quoc, tour: thirth_tour, date:"2016-1-1", check_in:"", check_out:"", status:"confirm", total_price: 0, hour_rate: 0)
fourth_booking = Booking.create!(visitor: andre, guide: quoc, tour: fourth_tour, date:"2016-1-1", check_in:"", check_out:"", status:"pending", total_price: 0, hour_rate: 0)
####

puts "create review"

first_review = Review.create!(booking: first_booking ,content: "First review of Q", rating: 5)
second_review = Review.create!(booking: second_booking ,content: "Second review of Q", rating: 5)
thirth_review = Review.create!(booking: thirth_booking ,content: "First review of Blane", rating: 5)
fourth_review = Review.create!(booking: fourth_booking ,content: "Second review of Blane", rating: 5)

####

puts "users, bookings, tours, reviews, categories created!"


