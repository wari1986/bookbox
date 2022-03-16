# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }]).
#   Character.create(name: 'Luke', movie: movies.first)
require "json"
require "open-uri"
puts "Cleaning database..."
Swap.destroy_all
Book.destroy_all
User.destroy_all
UserBookRelationship.destroy_all
Swap.destroy_all

brussels_addresses = ["1 Boulevard Adolphe Max, Bruxelles", "1 Rue d'Aerschot, Bruxelles", "1 Avenue Albert, Bruxelles", "1 Chaussée d'Alsemberg, Bruxelles", "1 Boulevard Anspach, Bruxelles", "1 Rue Antoine Dansaert, Bruxelles", "1 Boulevard Auguste Reyers, Bruxelles", "1 Rue du Bailli, Bruxelles", "1 Rue Belliard, Bruxelles", "1 Boulevard Brand Whitlock, Bruxelles", "1 Avenue Brugmann, Bruxelles", "1 Boulevard du Centenaire, Bruxelles", "1 Chaussée de Charleroi, Bruxelles", "1 Avenue Charles Quint, Bruxelles", "1 Avenue des Croix du Feu, Bruxelles", "1 Avenue De Fré, Bruxelles", "1 Boulevard de Smet de Naeyer, Bruxelles", "1 Boulevard Edmond Machtens, Bruxelles", "1 Boulevard Emile Jacqmain, Bruxelles", "1 Boulevard de l'Empereur, Bruxelles", "1 Avenue de l'Exposition, Bruxelles", "1 Avenue de l'Exposition Universelle, Bruxelles", "1 Avenue Fonsny, Bruxelles", "1 Avenue Franklin Roosevelt, Bruxelles", "1 Chaussée de Gand, Bruxelles", "1 Boulevard Général Jacques, Bruxelles", "1 Boulevard Général Wahis, Bruxelles", "1 Chaussée de Haecht, Bruxelles", "1 Avenue Houba de Strooper, Bruxelles", "1 Boulevard de l'Impératrice, Bruxelles", "1 Boulevard Industriel, Bruxelles", "1 Chaussée d'Ixelles, Bruxelles", "1 Avenue de Jette, Bruxelles", "1 Chaussée de Jette, Bruxelles", "1 Chaussée de La Hulpe, Bruxelles", "1 Boulevard Lambermont, Bruxelles", "1 Boulevard Lépold II, Bruxelles", "1 Avenue Léopold III, Bruxelles", "1 Rue de la Loi, Bruxelles", "1 Boulevard Louis Mettewie, Bruxelles", "1 Boulevard Louis Schmidt, Bruxelles", "1 Avenue Louise, Bruxelles", "1 Chaussée de Louvain, Bruxelles", "1 Boulevard Maurice Lemonnier, Bruxelles", "1 Rue du Marché aux Fromages, Bruxelles", "1 Rue du Midi, Bruxelles", "1 Chaussée de Mons, Bruxelles", "1 Rue Neuve, Bruxelles", "1 Chaussée de Ninove, Bruxelles", "1 Boulevard Pachéco, Bruxelles", "1 Boulevard Paepsem, Bruxelles", "1 Avenue du Parc, Bruxelles", "1 Avenue du Parc Royal, Bruxelles", "1 Boulevard de la Plaine, Bruxelles", "1 Boulevard Prince de Liège, Bruxelles", "1 Avenue de la Reine, Bruxelles", "1 Avenue de Roodebeek, Bruxelles", "1 Rue Royale, Bruxelles", "1 Boulevard Saint-Michel, Bruxelles", "1 Boulevard du Souverain, Bruxelles", "1 Rue de Stalle, Bruxelles", "1 Boulevard Sylvain Dupuis, Bruxelles", "1 Avenue de Tervueren, Bruxelles", "1 Boulevard du Triomphe, Bruxelles", "1 Quai des Usines, Bruxelles", "1 Avenue Van Praet, Bruxelles", "1 Avenue Van Volxem, Bruxelles", "1 Rue Victor Hugo, Bruxelles", "1 Avenue de Vilvorde, Bruxelles", "1 Chaussée de Vleurgat, Bruxelles", "1 Chaussée de Waterloo, Bruxelles", "1 Chaussée de Wavre, Bruxelles", "1 Avenue Wielemans Ceuppens, Bruxelles", "1 Avenue Winston Churchill, Bruxelles", "1 Boulevard de la Woluwe, Bruxelles"]

# creating users
all_users = []

# 26.times do |n|
#   lorem_face = (1..6750).to_a.sample
#   user_first_name = Faker::Name.neutral_first_name
#   user_last_name = Faker::Name.last_name
#   user = User.create(email: "#{user_first_name}.#{user_last_name}@email.com", password: '123456', address: brussels_addresses.sample, first_name: user_first_name, profile_picture: "https://faces-img.xcdn.link/image-lorem-face-#{lorem_face}.jpg")
#   all_users << user
# end

nicolas = User.create(
  email: "nicolas.charlier@email.com",
  password: '123456',
  address: "12 Cantersteen, Bruxelles",
  first_name: "Nicolas",
  profile_picture: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1633421201/qhsffpwp1olzffr5syoe.jpg"
)
all_users << nicolas

stephan = User.create(
  email: "stephan.dierckx@email.com",
  password: '123456',
  address: "16 rue Brederode, Bruxelles",
  first_name: "Stephan",
  profile_picture: "https://avatars.githubusercontent.com/u/90523184?v=4"
)
all_users << stephan

aadel = User.create(
  email: "aadel.bouzambou@email.com",
  password: '123456',
  address: "16 rue de la loi, Bruxelles",
  first_name: "Aadel",
  profile_picture: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1626242034/uf5ffo2mtg7jbifqorsz.jpg"
)
all_users << aadel

nicolay = User.create(
  email: "nicolay.camacho@email.com",
  password: '123456',
  address: "1 Avenue du Parc Royal, Bruxelles",
  first_name: "Nicolay",
  profile_picture: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1634729633/vouhh9c2jncalws6ofmf.jpg"
)
all_users << nicolay


p all_users

# creating book instances and for each book, the previous User-book relationships and swaps that have led to its current "owned" status
puts "Creating books, swaps and user-book relationships"

isbns = ["9780735222359", "9781419753961", "132400665X", "9781982134204", "9780306923043", "9781538724736", "9780063003057", "9781501110368", "9781982166793"]

# creating instances for each ISBN
isbns.each do |isbn|
  url = "https://www.googleapis.com/books/v1/volumes?q=isbn:#{isbn}"
  book_serialized = URI.open(url).read
  book_hash = JSON.parse(book_serialized)
  book_detail = book_hash["items"][0]["volumeInfo"]
  book = Book.new(
    condition: ["Used", "Good condition", "As new", "New"].sample,
    title: book_detail["title"],
    author: book_detail["authors"].first,
    category: book_detail["categories"][0],
    year: book_detail["publishedDate"].to_i,
    cover: book_detail["imageLinks"]["thumbnail"],
    description: book_detail["description"],
    language: book_detail["language"],
    credit_worth: (1..5).to_a.sample,
    displayed: ["true", "false"].sample,
    isbn: isbn
  )
  book.save
  p book

  # creating reviews
  # TO DO reviews should be written only by owners or previous owners of a book.
  titles = ["Good book, feel free to swap 😎", "Swapped this book and loved it", "Thanks Bookbox, would totally recommend 💙", "Excellent book", "Good read 😃", "Swapped it, loved it", "Amazing author!", "Really enjoyed that one 😲", "Didn't regret my swap!"]
  reviews = [
    "I liked this book. people would love this book because it teaches about trying a new thing and how it’s important to get past being scared so you can learn new things.",
    "It’s an easy chapter book with pictures on every page. I love the illustrations. Check it out in my bookshelf ✌",
    "While I definitely recommend this book to other readers, I would recommend it to older teenagers 👌",
    "Sometimes I forget that I am reading a story and not a real-life account. Her emotions and the dialogue are so genuine",
    "I would highly recommend this book to anyone who desires a guide to the future. Have a swap!",
    "I really think everyone would like the book. If you like animals, this one's for you, so I am expecting your swap requests 😁",
    "This is a beautiful and useful book for everyone. Highly recommend a swap.",
    "The way this book was written is just incredible. I don’t know how many times I wondered if I was possessed while reading it.",
    "Easy to read. The book sucks you right in. Very interesting and motivating.",
    "Great book, that I discovered thanks to Bookbox!! 💙",
    "I’ve read a ton of motivational books in this style, but this book is awesome!!! One of the best! 🤩",
    "Great book. Great author",
    "This book is a breath of fresh air, get it from my bookshelf 😍"
  ]
  reviews_per_book = (0..3).to_a.sample
  reviews_per_book.times do
    review = Review.new(
      title: titles.sample,
      stars: (3..5).to_a.sample,
      content: reviews.sample,
      book: book,
      user: User.order(Arel.sql('RANDOM()')).first
    )
    review.save
  end

  # creating a random number of total user-book relationships for this specific book
  # total_user_book_relationships = 1

  # # the counter let's us know when we reach the last user-book relationship
  # counter = 1
  # total_user_book_relationships.times do
  #   # only for the last user-book relationship is the book currently being owned (owned: true)
  #   # for other previous isntances owned: false
  #   user = all_users.sample
  #   if counter == total_user_book_relationships
  #     owned = true
  #   else
  #     owned = false
  #   end
    # TO DO, from the second iteration, user should be swapper, then swapper_2, etc.)
    user = all_users.sample
    user_book_relationship = UserBookRelationship.new(
      user: user,
      book: book,
      owned: true,
      address: user.address,
      latitude: user.latitude,
      longitude: user.longitude
    )
    user_book_relationship.save
    # owned = false means that the book has previously been swapped, therefore we are seeding swaps only if owned == false
    # swapper = User.order(Arel.sql('RANDOM()')).first
    # if user_book_relationship.owned == false
    #   # TO DO this needs to be fixed, as we don't know if this book is currently owned or not
    #   # TO DO swapper should become user in the next iteration, and so on, which is not the case
    #   swapped_book = swapper.books.sample
    #   swap = Swap.new(
    #     user: current_user,
    #     book: book,
    #     swapper: swapper,
    #     swapped_book: swapped_book
      # )
      # next iteration should be something like

      # swap = Swap.new(
      #   user: swapper,
      #   book: book,
      #   swapper: swapper_2,
      #   swapped_book: swapped_book,
      #   accepted: true
      # )

      # then
      # swap = Swap.new(
      #   user: swapper_2,
      #   book: book,
      #   swapper: swapper_3,
      #   swapped_book: swapped_book,
      #   accepted: true
    #   swap.save
    p user_book_relationship
    # p swap
    # counter += 1
  end


puts "New users, books, user-books relationships and swaps created"

# creating book reviews
