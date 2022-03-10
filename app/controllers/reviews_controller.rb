class ReviewsController < ApplicationController

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

  def destroy
    @review = Review.find(params[:id])
    @book = @review.book
    @review.destroy
    redirect_to book_path(@book)
  end

  private

  def review_params
    params.require(:review).permit(:title, :stars, :content)
  end
end
