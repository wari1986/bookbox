require "json"
require "open-uri"

class BooksController < ApplicationController
  def index
    @books = Book.all
    @markers = @books.geocoded.map do |book|
      {
        lat: book.latitude,
        lng: book.longitude
      }
    end
    if params[:query].present?
      @books = Book.where("title ILIKE ?", "%#{params[:query]}%")
    end
  end

  def show
    @book = Book.find(params[:id])
    # @renting = Renting.new

  end

  def new
    @book = Book.new
  end

  def create
    # @book = Book.new(book_params)
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
      user: current_user,
      isbn: params[:isbn]
    )
    @book.user = current_user

   if @book.save
     redirect_to action: "index"
   else
    render :new
   end

  end

  private

  def book_params
    params.require(:book).permit(:isbn, :condition, :displayed)
  end
end
