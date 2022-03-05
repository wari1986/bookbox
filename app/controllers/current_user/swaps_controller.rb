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
  end
end
