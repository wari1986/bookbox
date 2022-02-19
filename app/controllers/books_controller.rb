class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(params[:book])
    @book.save
  end

  def book_params
    params.require(:book).permit(:condition, :location, :cover, :title, :author, :category, :year, :descritpion, :language)
  end
end
