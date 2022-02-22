class BooksController < ApplicationController
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

  def new
    @book = Book.new
  end

  def create
    book = Book.new(book_params)
    book.user = current_user
    if @book.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    book = Book.find(params[:id])
    if @book.update(book_params)
     redirect_to book_path(@book)
    else
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    redirect_to book_path(@book)
  end


  private

  def book_params
    params.require(:book).permit(:title, :condition, :location, :author, :category, :year, :address, :cover, :description, :language, :credit_worth)
  end
end
