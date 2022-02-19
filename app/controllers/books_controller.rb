class BooksController < ApplicationController
<<<<<<< HEAD
=======
  def index
    @books = Book.all
    # @markers = [{
    #   lat: @book.latitude,
    #   lng: @book.longitude
    # }]
  end

  def show
    @book = Book.find(params[:id])
    # @renting = Renting.new

  end

>>>>>>> 738a5c8fa2ba8228cbb44ffde44752f31cbbd103
  def new
    @book = Book.new
  end

  def create
<<<<<<< HEAD
    @book = Book.new(params[:book])
    @book.save
  end

  def book_params
    params.require(:book).permit(:condition, :location, :cover, :title, :author, :category, :year, :descritpion, :language)
=======
    @book = Book.new(book_params)
    @book.user = current_user
   if @book.save
      redirect_to root_path
   else
    render :new
   end

  end

  private

  def book_params
    params.require(:book).permit(:title, :condition, :location, :author, :category, :year, :address, :cover, :description, :language, :credit_worth)
>>>>>>> 738a5c8fa2ba8228cbb44ffde44752f31cbbd103
  end
end
