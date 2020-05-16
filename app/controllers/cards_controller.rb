class CardsController < ApplicationController
  def show
    @cards = Card.all
  end

  def new
    @card = Card.new
  end

  def create
      @card = Card.new(card_params)
      if @card.save
        flash[:success] = "Card saved!"
        redirect_to request.referrer || root_url
      else
        flash[:warning] = "Card not saved!"
      end
    end

    def edit
      @card = Card.find(params[:id])
    end

    def update
      @card = Card.find(params[:id])
      #@card.assign_attributes(card_params)
      @card.update(card_params)

        flash[:success] = "Card updated!"
        redirect_to request.referrer || root_url
    

  end

    def destroy
    	#@card.destroy
      #flash[:success] = "Card deleted"
      #redirect_to request.referrer || root_url

      @card = Card.find(params[:id])
      if @card.present?
         @card.destroy
         flash[:success] = "Card deleted"
      end
      redirect_to request.referrer || root_url
    end


private
  def card_params
    params.require(:card).permit(:name, :description, :card_type, :logo_url, :signup_bonus_spend_required,
    :signup_bonus_points_earned, :annual_fee, :gas_points_multi)
  end

end
