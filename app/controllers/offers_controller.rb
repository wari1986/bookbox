class OffersController < ApplicationController
  # def index
  #   @offers = Offers.all
  # end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offers.new(offer_params)
    @offer.user = current_user
    if @offer.save
      redirect_to action: "index"
    else
      render :new
    end
  end

  def offer_params

  end
end
