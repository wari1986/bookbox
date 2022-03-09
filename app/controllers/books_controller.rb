require "json"
require "open-uri"

class BooksController < ApplicationController
  def index
    rels = current_user.user_book_relationships
    my_books = Book.where(id: rels.where(owned: true).select(:book_id))
    @books = Book.all - my_books
    if params[:query].present?
      @books = Book.where("title ILIKE ?", "%#{params[:query]}%")
    else
      @books
    end
  end

  def show
    @book = Book.find(params[:id])
    @user_book_relationship = UserBookRelationship.find_by(book: @book, owned: true)
    @swap = Swap.new
    @review = @book.reviews.build

    @markers = [
      {
        lat: @user_book_relationship.latitude,
        lng: @user_book_relationship.longitude
      }]
    # @renting = Renting.new
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

  # def create_relationship
  #   @create_deal = user_book_relationship = UserBookRelationship.new(
  #     user: user,
  #     book: book,
  #     owned: owned
  #   )
  #   user_book_relationship.save
  # end

  private

  def book_params
    params.require(:book).permit(:isbn, :condition, :displayed)
  end
end
