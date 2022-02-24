# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning database..."
Book.destroy_all
User.destroy_all

10.times do |n|
  User.create(email: "User#{n+1}@email.com", password: '123456')
end

file = URI.open('https://images-platform.99static.com/BHpj2snbFNhkiFQrmFhf6yeeAeU=/57x0:1968x1911/500x500/top/smart/99designs-contests-attachments/102/102712/attachment_102712980')

book = Book.new(
  title: "Zero to Coder",
  author: Faker::Book.author,
  year: (1800..2022).to_a.sample,
  category: Faker::Book.genre,
  language: %w[english spanish french german italian russian].sample,
  user: User.all.sample,
  location: Faker::Address.state
)
# book.cover.attach(io: file, filename: 'nes.png', content_type: 'image/png')
book.save
p book

file = URI.open('https://images-platform.99static.com//EWICGSNdiclY1G53ssuSZFGdwoo=/0x0:1240x1240/fit-in/500x500/99designs-contests-attachments/68/68943/attachment_68943033')

book = Book.new(
  title: "Get a coder Job",
  author: Faker::Book.author,
  year: (1800..2022).to_a.sample,
  category: Faker::Book.genre,
  language: %w[english spanish french german italian russian].sample,
  user: User.all.sample,
  location: Faker::Address.state
)
# book.cover.attach(io: file, filename: 'nes.png', content_type: 'image/png')
book.save
p book
#https://upload.wikimedia.org/wikipedia/en/6/6b/Harry_Potter_and_the_Philosopher%27s_Stone_Book_Cover.jpg


file = URI.open('https://images.routledge.com/common/jackets/originals/978113862/9781138629646.tif')

book = Book.new(
  title: "The art of coding",
  author: Faker::Book.author,
  year: (1800..2022).to_a.sample,
  category: Faker::Book.genre,
  language: %w[english spanish french german italian russian].sample,
  user: User.all.sample,
  location: Faker::Address.state
)
# book.cover.attach(io: file, filename: 'nes.png', content_type: 'image/png')
book.save
p book
#https://upload.wikimedia.org/wikipedia/en/6/6b/Harry_Potter_and_the_Philosopher%27s_Stone_Book_Cover.jpg


file = URI.open('https://media.comicbook.com/2019/03/captain-marvel-1-2014-cover-1161703.jpeg')

book = Book.new(
  title: "Captain Marvel",
  author: Faker::Book.author,
  year: (1800..2022).to_a.sample,
  category: Faker::Book.genre,
  language: %w[english spanish french german italian russian].sample,
  user: User.all.sample,
  location: Faker::Address.state
)
# book.cover.attach(io: file, filename: 'nes.png', content_type: 'image/png')
book.save
p book
#https://upload.wikimedia.org/wikipedia/en/6/6b/Harry_Potter_and_the_Philosopher%27s_Stone_Book_Cover.jpg


file = URI.open('https://i1.sndcdn.com/artworks-000504093942-htx4tx-t500x500.jpg')

book = Book.new(
  title: "Avengers Endgame",
  author: Faker::Book.author,
  year: (1800..2022).to_a.sample,
  category: Faker::Book.genre,
  language: %w[english spanish french german italian russian].sample,
  user: User.all.sample,
  location: Faker::Address.state
)
# book.cover.attach(io: file, filename: 'nes.png', content_type: 'image/png')
book.save
p book
#https://upload.wikimedia.org/wikipedia/en/6/6b/Harry_Potter_and_the_Philosopher%27s_Stone_Book_Cover.jpg


file = URI.open('https://images-na.ssl-images-amazon.com/images/I/91OINeHnJGL.jpg')

book = Book.new(
  title: "Harry Potter and the chamber of secrets",
  author: Faker::Book.author,
  year: (1800..2022).to_a.sample,
  category: Faker::Book.genre,
  language: %w[english spanish french german italian russian].sample,
  user: User.all.sample,
  location: Faker::Address.state
)
# book.cover.attach(io: file, filename: 'nes.png', content_type: 'image/png')
book.save
p book
#https://upload.wikimedia.org/wikipedia/en/6/6b/Harry_Potter_and_the_Philosopher%27s_Stone_Book_Cover.jpg


file = URI.open('https://images-na.ssl-images-amazon.com/images/I/81YdJ9gZ6+L.jpg')

book = Book.new(
  title: "Rise of the Black Panther",
  author: Faker::Book.author,
  year: (1800..2022).to_a.sample,
  category: Faker::Book.genre,
  language: %w[english spanish french german italian russian].sample,
  user: User.all.sample,
  location: Faker::Address.state
)
# book.cover.attach(io: file, filename: 'nes.png', content_type: 'image/png')
book.save
p book
#https://upload.wikimedia.org/wikipedia/en/6/6b/Harry_Potter_and_the_Philosopher%27s_Stone_Book_Cover.jpg


file = URI.open('https://images-na.ssl-images-amazon.com/images/I/618vUrPK1vL._SX337_BO1,204,203,200_.jpg')

book = Book.new(
  title: "Avenger - Age of Ultron",
  author: Faker::Book.author,
  year: (1800..2022).to_a.sample,
  category: Faker::Book.genre,
  language: %w[english spanish french german italian russian].sample,
  user: User.all.sample,
  location: Faker::Address.state
)
# book.cover.attach(io: file, filename: 'nes.png', content_type: 'image/png')
book.save
p book
#https://upload.wikimedia.org/wikipedia/en/6/6b/Harry_Potter_and_the_Philosopher%27s_Stone_Book_Cover.jpg


file = URI.open('https://media.senscritique.com/media/000018311407/source_big/Jusqu_a_la_mort_V_Marvel_Legacy_Avengers_tome_7.jpg')

book = Book.new(
  title: "Avengers",
  author: Faker::Book.author,
  year: (1800..2022).to_a.sample,
  category: Faker::Book.genre,
  language: %w[english spanish french german italian russian].sample,
  user: User.all.sample,
  location: Faker::Address.state
)
# book.cover.attach(io: file, filename: 'nes.png', content_type: 'image/png')
book.save
p book
#https://upload.wikimedia.org/wikipedia/en/6/6b/Harry_Potter_and_the_Philosopher%27s_Stone_Book_Cover.jpg


file = URI.open('https://img.chirpbooks.com/image/fetch/f_auto,q_auto:eco,w_700,h_700/https%3A//images.findawayworld.com/v1/image/cover/CD345341%3Faspect%3D1%3A1%26width%3D960')

book = Book.new(
  title: "Avengers - Infinity",
  author: Faker::Book.author,
  year: (1800..2022).to_a.sample,
  category: Faker::Book.genre,
  language: %w[english spanish french german italian russian].sample,
  user: User.all.sample,
  location: Faker::Address.state
)
# book.cover.attach(io: file, filename: 'nes.png', content_type: 'image/png')
book.save
p book
#https://upload.wikimedia.org/wikipedia/en/6/6b/Harry_Potter_and_the_Philosopher%27s_Stone_Book_Cover.jpg


file = URI.open('https://i5.walmartimages.com/asr/a8e6a50a-a2fc-4550-b4f4-6cbf13a67ae1.f6979a84ea6d498400c1d849f422ed83.jpeg?odnHeight=612&odnWidth=612&odnBg=FFFFFF')

book = Book.new(
  title: "Ruby on Rails - Novice to Ninja",
  author: Faker::Book.author,
  year: (1800..2022).to_a.sample,
  category: Faker::Book.genre,
  language: %w[english spanish french german italian russian].sample,
  user: User.all.sample,
  location: Faker::Address.state
)
# book.cover.attach(io: file, filename: 'nes.png', content_type: 'image/png')
book.save
p book
#https://upload.wikimedia.org/wikipedia/en/6/6b/Harry_Potter_and_the_Philosopher%27s_Stone_Book_Cover.jpg


puts "users newd and books created"
