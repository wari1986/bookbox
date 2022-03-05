class SwapsController < ApplicationController
  def new
    @swap = Swap.new
    @user_book_relationship = UserBookRelationship.find(params[:user_book_relationship_id])
    @mybooks = UserBookRelationship.where(user: current_user, owned: true).map { |user_book_relationship| user_book_relationship.book}
  end

  def create
    @user_book_relationship = UserBookRelationship.find(params[:user_book_relationship_id])
    @swap = Swap.new(
      user: current_user,
      swapper: @user_book_relationship.user,
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

  def confirm
    update_user_book_relationship(@swap.swapper, @swap.swapped_book)
    update_user_book_relationship(@swap.user, @swap.book)
    @new_user_book_relationship_swapper = UserBookRelationship.new(
      user: @swap.swapper,
      book: @swap.book,
      owned: true
    )
    @new_user_book_relationship_swapper.save
    @new_user_book_relationship_owner = UserBookRelationship.new(
      user: @swap.user,
      book: @swap.swapped_book,
      owned: true
    )
    @new_user_book_relationship_owner.save
    redirect_to book_path(@swap.swapped_book_id)
  end

  private

  def swap_params
    params.require(:swap).permit(:swapped_book)
  end

  def update_user_book_relationship(swapping_user, swapping_book)
    user_book_relationship_swapper = UserBookRelationship.find_by(user: swapping_user, book: swapping_book)
    user_book_relationship_swapper.owned = false
    user_book_relationship_swapper.save
  end
end
