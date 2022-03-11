require "json"
require "open-uri"

class BooksController < ApplicationController
  def index
    rels = current_user.user_book_relationships
    my_books = Book.where(id: rels.where(owned: true).select(:book_id))
    hidden_books = Book.where(displayed: false)
    @books = Book.all - hidden_books - my_books
    if params[:query].present?
      @books = Book.where("title ILIKE ?", "%#{params[:query]}%")
    else
      @books
    end
    @index_distances = index_distances
  end

  def show
    @book = Book.find(params[:id])
    @swap = Swap.new
    @review = Review.new
    find_previous_owners
    find_markers
    @distance = distance(@book)
  end

  def new
    @book = Book.new
  end

  def create
    url = "https://www.googleapis.com/books/v1/volumes?q=isbn:#{book_params[:isbn]}"
    book_serialized = URI.open(url).read
    book_hash = JSON.parse(book_serialized)
    book_detail = book_hash["items"][0]["volumeInfo"]
    @book = Book.new(
      condition: book_params[:condition],
      location: current_user.address,
      title: book_detail["title"],
      author: book_detail["authors"].first,
      category: book_detail["categories"][0],
      year: book_detail["publishedDate"].to_i,
      cover: book_detail["imageLinks"]["thumbnail"],
      description: book_detail["description"],
      language: book_detail["language"],
      displayed: book_params[:displayed],
      isbn: params[:isbn]
    )

    if @book.save
      user_book_relationship = UserBookRelationship.new(
        owned: true,
        user: current_user,
        book: @book,
        address: current_user.address
      )
      user_book_relationship.save
      redirect_to book_path(@book)
    else
      render :new
    end
  end

  def update
    @book = Book.find(params[:id])
    @book.displayed = false
    @book.save
    redirect_to books_path
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to dashboard_path
  end

  private

  def find_markers
    user_book_relationship = UserBookRelationship.find_by(book: @book, owned: true)
    @markers = [
      {
        lat: user_book_relationship.latitude,
        lng: user_book_relationship.longitude
      }]
  end

  def find_previous_owners
    previous_owners_ids = UserBookRelationship.where(book: @book, owned: false).pluck(:user_id).to_a
    @previous_owners = User.find(previous_owners_ids)
  end

  def distance(book)
    current_user_book_relationship = UserBookRelationship.find_by(user: current_user, owned: true)
    user_book_relationship = UserBookRelationship.find_by(book: book, owned: true)
    Geocoder::Calculations.distance_between([user_book_relationship.latitude, user_book_relationship.longitude], [current_user_book_relationship.latitude,current_user_book_relationship.longitude]).round
  end

  def index_distances
    distances = []
    @books.each do |book|
      current_user_book_relationship = UserBookRelationship.find_by(user: current_user, owned: true)
      unless current_user.user_book_relationships == []
        user_book_relationship2 = UserBookRelationship.find_by(book: "#{book.id}", owned: true)
        distance = Geocoder::Calculations.distance_between([user_book_relationship2.latitude, user_book_relationship2.longitude], [current_user_book_relationship.latitude,current_user_book_relationship.longitude]).round
        distances << distance
      end
    end
    distances
  end

  def book_params
    params.require(:book).permit(:isbn, :condition, :displayed)
  end
end
