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
Book.destroy_all
User.destroy_all
brussels_addresses = ["1 Boulevard Adolphe Max, Bruxelles", "1 Rue d'Aerschot, Bruxelles", "1 Avenue Albert, Bruxelles", "1 Chaussée d'Alsemberg, Bruxelles", "1 Boulevard Anspach, Bruxelles", "1 Rue Antoine Dansaert, Bruxelles", "1 Boulevard Auguste Reyers, Bruxelles", "1 Rue du Bailli, Bruxelles", "1 Rue Belliard, Bruxelles", "1 Boulevard Brand Whitlock, Bruxelles", "1 Avenue Brugmann, Bruxelles", "1 Boulevard du Centenaire, Bruxelles", "1 Chaussée de Charleroi, Bruxelles", "1 Avenue Charles Quint, Bruxelles", "1 Avenue des Croix du Feu, Bruxelles", "1 Avenue De Fré, Bruxelles", "1 Boulevard de Smet de Naeyer, Bruxelles", "1 Boulevard Edmond Machtens, Bruxelles", "1 Boulevard Emile Jacqmain, Bruxelles", "1 Boulevard de l'Empereur, Bruxelles", "1 Avenue de l'Exposition, Bruxelles", "1 Avenue de l'Exposition Universelle, Bruxelles", "1 Avenue Fonsny, Bruxelles", "1 Avenue Franklin Roosevelt, Bruxelles", "1 Chaussée de Gand, Bruxelles", "1 Boulevard Général Jacques, Bruxelles", "1 Boulevard Général Wahis, Bruxelles", "1 Chaussée de Haecht, Bruxelles", "1 Avenue Houba de Strooper, Bruxelles", "1 Boulevard de l'Impératrice, Bruxelles", "1 Boulevard Industriel, Bruxelles", "1 Chaussée d'Ixelles, Bruxelles", "1 Avenue de Jette, Bruxelles", "1 Chaussée de Jette, Bruxelles", "1 Chaussée de La Hulpe, Bruxelles", "1 Boulevard Lambermont, Bruxelles", "1 Boulevard Lépold II, Bruxelles", "1 Avenue Léopold III, Bruxelles", "1 Rue de la Loi, Bruxelles", "1 Boulevard Louis Mettewie, Bruxelles", "1 Boulevard Louis Schmidt, Bruxelles", "1 Avenue Louise, Bruxelles", "1 Chaussée de Louvain, Bruxelles", "1 Boulevard Maurice Lemonnier, Bruxelles", "1 Rue du Marché aux Fromages, Bruxelles", "1 Rue du Midi, Bruxelles", "1 Chaussée de Mons, Bruxelles", "1 Rue Neuve, Bruxelles", "1 Chaussée de Ninove, Bruxelles", "1 Boulevard Pachéco, Bruxelles", "1 Boulevard Paepsem, Bruxelles", "1 Avenue du Parc, Bruxelles", "1 Avenue du Parc Royal, Bruxelles", "1 Boulevard de la Plaine, Bruxelles", "1 Boulevard Prince de Liège, Bruxelles", "1 Avenue de la Reine, Bruxelles", "1 Avenue de Roodebeek, Bruxelles", "1 Rue Royale, Bruxelles", "1 Boulevard Saint-Michel, Bruxelles", "1 Boulevard du Souverain, Bruxelles", "1 Rue de Stalle, Bruxelles", "1 Boulevard Sylvain Dupuis, Bruxelles", "1 Avenue de Tervueren, Bruxelles", "1 Boulevard du Triomphe, Bruxelles", "1 Quai des Usines, Bruxelles", "1 Avenue Van Praet, Bruxelles", "1 Avenue Van Volxem, Bruxelles", "1 Rue Victor Hugo, Bruxelles", "1 Avenue de Vilvorde, Bruxelles", "1 Chaussée de Vleurgat, Bruxelles", "1 Chaussée de Waterloo, Bruxelles", "1 Chaussée de Wavre, Bruxelles", "1 Avenue Wielemans Ceuppens, Bruxelles", "1 Avenue Winston Churchill, Bruxelles", "1 Boulevard de la Woluwe, Bruxelles"]
all_users = []
30.times do |n|
  user = User.create(email: "User#{n+1}@email.com", password: '123456', address: brussels_addresses.sample)
  all_users << user
end
p all_users
isbns = ["9781632062567", "9781632061195", "9781632060327", "9781632060976", "9781632061744", "9781632060754", "9781632060785", "9780525562047", "9781400078431", "9780374529949", "9780525559474", "9780593358337", "9780062292070", "9780385547932", "9780060959470", "9780525657743", "9780374212230", "9781501161933", "9780374212230", "9781501161933", "9780374532079", "9780399592553", "9780451524935", "9781984822185", "9781878424310", "9780374532079", "9781449489892", "9780143105329", "9780785834205", "9780062888433", "9781538732182", "9780345350688", "9780385348737", "9781984877925", "9781538703526", "9781984806758", "9780060959470", "9780441013593", "9781449486792",  "9780441172719", "9780762447695", "9781945649134", "9780525536963", "9780316299220", "9780063159983", "9780399590528", "9780735219106", "9781982108649", "9781250209788", "9780593296691", "9780062868947", "9781501110368", "9781607105541", "9781626860605", "9781607109464", "9781607105510", "9781607105480", "9781626863903", "9781607107316", "9781645173625", "9781645173496", "9781626866072", "9781607105565", "9781607105534", "9781684122882", "9781607109457", "9781626869721", "9781645171782", "9781626863910", "9781607105572", "9781684122905", "9781626863927", "9781626860636","9781607105558","9781607107323","9781607107286", "9781607108160", "9781626864672", "9781684122936", "9781626862555", "9781645170006", "9781607107293", "9781684129201", "9781607109433", "9781626863934", "9781626860551", "9781626860575", "9781607109471", "9781684129997", "9781607109440", "9781684126583", "9781684129959"]
counter = 1
isbns.each do |isbn|
  user = all_users.sample
  p counter
  url = "https://www.googleapis.com/books/v1/volumes?q=isbn:#{isbn}"
  book_serialized = URI.open(url).read
  book_hash = JSON.parse(book_serialized)
  book_detail = book_hash["items"][0]["volumeInfo"]
    book = Book.new(
      condition: ["Used", "Good condition", "As new", "New"].sample,
      location: user.address,
      title: book_detail["title"],
      author: book_detail["authors"].first,
      category: book_detail["categories"][0],
      year: book_detail["publishedDate"].to_i,
      cover: book_detail["imageLinks"]["thumbnail"],
      description: book_detail["description"],
      language: book_detail["language"],
      credit_worth: (1..5).to_a.sample,
      displayed: ["true", "false"].sample,
      user: user, #current_user,
      isbn: isbn
    )
    book.save
    p book
  counter = counter + 1
  end
puts "New users and books created"
