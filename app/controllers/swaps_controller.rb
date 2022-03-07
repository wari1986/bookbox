class SwapsController < ApplicationController
  def new
    @swap = Swap.new
    @user_book_relationship = UserBookRelationship.find(params[:user_book_relationship_id])
    @mybooks = UserBookRelationship.where(user: current_user, owned: true).map { |user_book_relationship| user_book_relationship.book}
  end

  def create
    @user_book_relationship = UserBookRelationship.find(params[:user_book_relationship_id])
    @swap = Swap.new(
      user: @user_book_relationship.user,
      swapper: current_user,
      book: @user_book_relationship.book,
      swapped_book: Book.find(params[:swap][:swapped_book_id])
    )

    if @swap.save
      redirect_to current_user_swaps_path
    else
      render :new
    end
  end

  def update
    @swap = Swap.find(params[:id])
    @swap.accepted = params[:accepted]
    @swap.save
    redirect_to book_path(@swap.swapped_book_id)
  end


  private

  def swap_params
    params.require(:swap).permit(:swapped_book)
  end

end
