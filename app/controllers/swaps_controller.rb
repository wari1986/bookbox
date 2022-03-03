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
end
