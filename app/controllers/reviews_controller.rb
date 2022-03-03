class ReviewsController < ApplicationController
  # before_action :set_book

  def new
    @book = Book.find(params[:book_id])
    @review = Review.new
  end

  def create
    @book = Book.find(params[:book_id])
    @review = Review.new(review_params)
    @review.book = @book
    @review.user = current_user

    if @review.save
      redirect_to book_path(@book)
    else
      render 'new'
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :stars, :content)
  end
end
