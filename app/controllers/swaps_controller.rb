class SwapsController < ApplicationController
  def new
    @swap = Swap.new
    @book = Book.find(params[:book_id])
    @mybooks = UserBookRelationship.where(user: current_user, owned: true).map { |user_book_relationship| user_book_relationship.book}
  end

  def create
    @user_book_relationship = UserBookRelationship.find_by(book: params[:book_id], owned: true)
    @swap = Swap.new(
      user: @user_book_relationship.user,
      swapper: current_user,
      book: @user_book_relationship.book,
      swapped_book: Book.find(params[:swap][:book_id])
    )
    if @swap.save
      Chatroom.create(swap: @swap)
      redirect_to current_user_swaps_path
    else
      render :new
    end
  end

  def update
    @swap = Swap.find(params[:id])
    @swap.accepted = params[:accepted]
    @swap.save
    redirect_to "/current_user/swaps"
  end


  private

  def swap_params
    params.require(:swap).permit(:swapped_book)
  end

end
