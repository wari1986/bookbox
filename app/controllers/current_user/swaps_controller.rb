class CurrentUser::SwapsController < ApplicationController
  def index
    # all the swap (offers) that I have received and are pending for validation by me
    # TO DO: add a "pending" for :accepted (so change accepted from boolean to string)
    @pending_incoming_swaps = current_user.incoming_swaps.where(accepted: nil)
    @pending_incoming_swaps_count = @pending_incoming_swaps.count

    # all the swaps that I have made and are pending for validation by the owner
    # TO DO: add a "pending" for :accepted (so change accepted from boolean to string)
    @pending_requested_swaps = current_user.requested_swaps.where(accepted: nil)
    @pending_requested_swaps_count = @pending_requested_swaps.count

    accepted_incoming_swaps = current_user.incoming_swaps.where(accepted: true, confirmed: nil)
    accepted_requested_swaps = current_user.requested_swaps.where(accepted: true, confirmed: nil)
    @accepted_swaps = accepted_incoming_swaps + accepted_requested_swaps
  end

  def update
    @swap = Swap.find(params[:id])
    @swap.confirmed = params[:confirmed]
    update_user_book_relationship(@swap.swapper, @swap.swapped_book)
    update_user_book_relationship(@swap.user, @swap.book)
    @new_user_book_relationship_swapper = UserBookRelationship.new(
      user: @swap.swapper,
      book: @swap.book,
      owned: true,
      address: @swap.swapper.address
    )
    @new_user_book_relationship_swapper.save
    @new_user_book_relationship_owner = UserBookRelationship.new(
      user: @swap.user,
      book: @swap.swapped_book,
      owned: true,
      address: @swap.user.address
    )
    @new_user_book_relationship_owner.save
    @swap.save
    redirect_to book_path(@swap.swapped_book_id)
  end

  private

  def update_user_book_relationship(swapping_user, swapping_book)
    user_book_relationship_swapper = UserBookRelationship.find_by(user: swapping_user, book: swapping_book)
    user_book_relationship_swapper.owned = false
    user_book_relationship_swapper.save
  end

  def strong_params
    params.require(:swap).permit(:confirmed)
  end
end
