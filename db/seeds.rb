'CLOUDINARY_URL=cloudinary://941881364241441:77aGNAdIpIUU-FhdGW9G2N0_aLI@duxuerelt
'# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "json"
require "open-uri"

url = "https://www.googleapis.com/books/v1/volumes?q=isbn:9780151002177"
book_serialized = URI.open(url).read
book_hash = JSON.parse(book_serialized)
book_detail = book_hash["items"][0]["volumeInfo"]

puts "Cleaning database..."
Book.destroy_all
User.destroy_all

10.times do |n|
  User.create(email: "User#{n+1}@email.com", password: '123456')
end

book = Book.new(
  condition: ["Used", "Good condition", "As new", "new"].sample,
  location: Faker::Address.state,
  title: book_detail["title"],
  author: book_detail["authors"].first,
  category: book_detail["categories"][0],
  year: book_detail["publishedDate"].to_i,
  cover: book_detail["imageLinks"]["thumbnail"],
  description: book_detail["description"],
  language: book_detail["language"],
  credit_worth: (1..5).to_a.sample,
  displayed: ["true", "false"].sample,
  user: User.all.sample
)
book.save
p book
puts "users newd and books created"
