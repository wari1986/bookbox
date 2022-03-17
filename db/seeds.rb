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

brussels_addresses = ["1 Boulevard Adolphe Max, Bruxelles", "1 Rue d'Aerschot, Bruxelles", "1 Avenue Albert, Bruxelles", "1 Chaussée d'Alsemberg, Bruxelles", "1 Boulevard Anspach, Bruxelles", "1 Rue Antoine Dansaert, Bruxelles", "1 Boulevard Auguste Reyers, Bruxelles", "1 Rue du Bailli, Bruxelles", "1 Rue Belliard, Bruxelles", "1 Boulevard Brand Whitlock, Bruxelles", "1 Avenue Brugmann, Bruxelles", "1 Boulevard du Centenaire, Bruxelles", "1 Chaussée de Charleroi, Bruxelles", "1 Avenue Charles Quint, Bruxelles", "1 Avenue des Croix du Feu, Bruxelles", "1 Avenue De Fré, Bruxelles", "1 Boulevard de Smet de Naeyer, Bruxelles", "1 Boulevard Edmond Machtens, Bruxelles", "1 Boulevard Emile Jacqmain, Bruxelles", "1 Boulevard de l'Empereur, Bruxelles", "1 Avenue de l'Exposition, Bruxelles", "1 Avenue de l'Exposition Universelle, Bruxelles", "1 Avenue Fonsny, Bruxelles", "1 Avenue Franklin Roosevelt, Bruxelles", "1 Chaussée de Gand, Bruxelles", "1 Boulevard Général Jacques, Bruxelles", "1 Boulevard Général Wahis, Bruxelles", "1 Chaussée de Haecht, Bruxelles", "1 Avenue Houba de Strooper, Bruxelles", "1 Boulevard de l'Impératrice, Bruxelles", "1 Boulevard Industriel, Bruxelles", "1 Chaussée d'Ixelles, Bruxelles", "1 Avenue de Jette, Bruxelles", "1 Chaussée de Jette, Bruxelles", "1 Chaussée de La Hulpe, Bruxelles", "1 Boulevard Lambermont, Bruxelles", "1 Avenue Léopold III, Bruxelles", "1 Rue de la Loi, Bruxelles", "1 Boulevard Louis Mettewie, Bruxelles", "1 Boulevard Louis Schmidt, Bruxelles", "1 Avenue Louise, Bruxelles", "1 Chaussée de Louvain, Bruxelles", "1 Boulevard Maurice Lemonnier, Bruxelles", "1 Rue du Marché aux Fromages, Bruxelles", "1 Rue du Midi, Bruxelles", "1 Chaussée de Mons, Bruxelles", "1 Rue Neuve, Bruxelles", "1 Chaussée de Ninove, Bruxelles", "1 Boulevard Pachéco, Bruxelles", "1 Boulevard Paepsem, Bruxelles", "1 Avenue du Parc, Bruxelles", "1 Avenue du Parc Royal, Bruxelles", "1 Boulevard de la Plaine, Bruxelles", "1 Boulevard Prince de Liège, Bruxelles", "1 Avenue de la Reine, Bruxelles", "1 Avenue de Roodebeek, Bruxelles", "1 Rue Royale, Bruxelles", "1 Boulevard Saint-Michel, Bruxelles", "1 Boulevard du Souverain, Bruxelles", "1 Rue de Stalle, Bruxelles", "1 Boulevard Sylvain Dupuis, Bruxelles", "1 Avenue de Tervueren, Bruxelles", "1 Boulevard du Triomphe, Bruxelles", "1 Quai des Usines, Bruxelles", "1 Avenue Van Praet, Bruxelles", "1 Avenue Van Volxem, Bruxelles", "1 Rue Victor Hugo, Bruxelles", "1 Avenue de Vilvorde, Bruxelles", "1 Chaussée de Vleurgat, Bruxelles", "1 Chaussée de Waterloo, Bruxelles", "1 Chaussée de Wavre, Bruxelles", "1 Avenue Wielemans Ceuppens, Bruxelles", "1 Avenue Winston Churchill, Bruxelles", "1 Boulevard de la Woluwe, Bruxelles"]

# creating users
all_users = []

26.times do
  lorem_face = (1..6750).to_a.sample
  user_first_name = Faker::Name.neutral_first_name
  user_last_name = Faker::Name.last_name
  user = User.create(email: "#{user_first_name}.#{user_last_name}@email.com", password: '123456', address: brussels_addresses.sample, first_name: user_first_name, profile_picture: "https://faces-img.xcdn.link/image-lorem-face-#{lorem_face}.jpg")
  all_users << user
end

nicolas = User.create(
  email: "nicolas.charlier@email.com",
  password: '123456',
  address: "12 Cantersteen, Bruxelles",
  first_name: "Nicolas",
  profile_picture: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1633421201/qhsffpwp1olzffr5syoe.jpg"
)
all_users << nicolas

niko = User.create(
  email: "niko@notlewagon.com",
  password: '123123',
  address: "32 Avenue Louise, Bruxelles",
  first_name: "Niko",
  profile_picture: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1611829368/e3nctdls7b1wcty3vtgz.jpg"
)
all_users << niko

pascaline = User.create(
  email: "pascaline@notlewagon.com",
  password: '123456',
  address: "Place Dailly, Bruxelles",
  first_name: "Pascaline",
  profile_picture: "https://ca.slack-edge.com/T02NE0241-U02758YT9V3-1142318f5670-512"
)
all_users << pascaline


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
  address: "10 Cantersteen, Bruxelles",
  first_name: "Nicolay",
  profile_picture: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1634729633/vouhh9c2jncalws6ofmf.jpg"
)
all_users << nicolay


p all_users

# creating book instances and for each book, the previous User-book relationships and swaps that have led to its current "owned" status
puts "Creating books, swaps and user-book relationships"

isbns = ["9780735222359", "9781419753961", "132400665X", "9781982134204", "9780306923043", "9781538724736", "9780063003057", "9781501110368", "9781982166793", "9781250830449", "9780441172719", "9780762447695", "9781945649134", "9783836582339", "9780525536963", "9780316299220", "9780063159983", "9780399590528", "9780735219106", "9781982108649", "9781368008495", "9781250209788", "9780593296691", "9780062868947", "9781632062567", "9780060959470",  "9780060959470", "1583335862", "9781368060677", "9780062292070",  "9780062888433",  "9780143105329",  "9780345350688",  "9780374212230",  "9780374212230",  "9780374529949", "1452179611", "9780374532079",  "9780374532079",  "9780385348737", "9781538719961", "9780385547932",  "9780399592553",  "9780441013593", "1476753830", "9780451524935",  "9780525559474",  "9780525562047",  "9780525657743",  "9780593358337",  "9780785834205",  "9781400078431", "9781451648539", "9781449486792",  "9781449489892",  "9781501110368",  "9781501161933",  "9781501161933",  "9781538703526",  "9781538732182",  "9781607105480",  "9781607105510",  "9781607105534",  "9781607105541",  "9781607105565",  "9781607105572",  "9781607107293",  "9781607107316",  "9781607108160",  "9781607109433",  "9781607109440",  "9781607109457",  "9781607109464",  "9781607109471",  "9781626860551",  "9781626860575",  "9781626860605",  "9781626860636",  "9781626862555",  "9781626863903",  "9781626863910",  "9781626863927",  "9781626863934",  "9781626864672",  "9781626866072",  "9781626869721",  "9781632060327",  "9781632060754",  "9781632060785",  "9781632060976",  "9781632061195",  "9781632061744",  "9781645170006",  "9781645171782",  "9781645173496",  "9781645173625",  "9781684122882",  "9781684122905",  "9781684122936",  "9781684126583",  "9781684129201",  "9781684129959",  "9781684129997",  "9781878424310",  "9781984806758",  "9781984822185",  "9781984877925", "9780374212230", "9780394747231", "9780399592553", "9780735220201", "9781250274618", "9781501160844", "9781501161933", "9781501161933", "9781524798642", "9781534441613", "9781542025607", "9781607105558", "9781607107286", "9781607107323", "9781620976814", "9781635574074", "9781662915352"]

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
    credit_worth: (3..5).to_a.sample,
    displayed: ["true", "false"].sample,
    isbn: isbn
  )
  book.save
  p book

  # creating reviews
  # TO DO reviews should be written only by owners or previous owners of a book.
  titles = ["Good book, feel free to swap", "Swapped this book and loved it", "Thanks Bookbox, would totally recommend", "Excellent book", "Good read!", "Swapped it, loved it", "Amazing author!", "Really enjoyed that one", "Didn't regret my swap!"]
  reviews = [
    "I loved this book 😍 People would love this book because it teaches about trying a new thing and how it’s important to get past being scared so you can learn new things.",
    "It’s an easy chapter book with pictures on every page. I love the illustrations. Check it out in my bookshelf ✌",
    "While I definitely recommend this book to other readers, I would recommend it to older teenagers 👌",
    "Sometimes I forget that I am reading a story and not a real-life tale. Her emotions and the dialogue are so genuine",
    "I would highly recommend this book to anyone who desires a guide to the future. Have a swap!",
    "I really think everyone would like the book. If you like animals, this one's for you, so I am expecting your swap requests 😁",
    "This is a beautiful and useful book for everyone. 🤩 Highly recommend a swap.",
    "The way this book was written is just incredible ✨ Almost got possessed while reading it.",
    "Easy to read. The book sucks you right in. Very interesting and motivating.",
    "Great book, that I discovered thanks to Bookbox!! 💙",
    "I’ve read a ton of motivational books in this style, but this book is awesome!!! One of the best! 🤩",
    "Great book. Great author. Loved it 📚",
    "This book is a breath of fresh air, get it from my bookshelf 😍"
  ]
  reviews_per_book = (2..4).to_a.sample
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
