class BooksController < ApplicationController
  def index
    @books = Book.all
    # @markers = [{
      #   lat: @book.latitude,
      #   lng: @book.longitude
    # }]
    if params[:query].present?
      @books = Book.where("title ILIKE ?", "%#{params[:query]}%")
    else
      @books = Book.all
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
    @book = Book.new(book_params)
    @book.user = current_user
   if @book.save
     redirect_to action: "index"
   else
    render :new
   end

  end

  private

  def book_params
    params.require(:book).permit(:title, :condition, :location, :author, :category, :year, :address, :cover, :description, :language, :credit_worth)
  end
end
