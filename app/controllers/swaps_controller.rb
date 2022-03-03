class SwapsController < ApplicationController
  def decline
    @swap = Swap.find(params[:id])
    @swap.accepted = false
    @swap.save
    redirect_to dashboard_path
  end

  def accept
    @swap = Swap.find(params[:id])
    @swap.accepted = true
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

  def update_user_book_relationship(swapping_user, swapping_book)
    user_book_relationship_swapper = UserBookRelationship.find_by(user: swapping_user, book: swapping_book)
    user_book_relationship_swapper.owned = false
    user_book_relationship_swapper.save
  end

end
