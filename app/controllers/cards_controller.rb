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
    :signup_bonus_points_earned, :annual_fee, :gas_points_multi, :gas_points_limit,	:gas_points_multi_limit,
    :grocery_points_multi,	:grocery_points_limit,	:grocery_points_multi_limit,	:dining_point_multi,
    :dining_points_limit,	:dining_points_multi_limit,	:hotel_points_multi,	:hotel_points_limit,
    :hotel_points_multi_limit,	:airfare_points_multi,	:airfare_points_limit,
    :airfare_points_multi_limit,	:other_points_multi,	:other_points_limit,	:other_points_multi_limit,
    :point_value,	:sign_up_bonus_cash,	:gas_cash_rate,	:gas_cash_limit,	:gas_cash_multi_limit,
    :grocery_cash_rate,	:grocery_cash_limit,	:grocery_cash_multi_limit,	:dining_cash_rate,
    :dining_cash_limit,	:dining_cash_multi_limit,	:hotel_cash_rate,	:hotel_cash_limit,
    :hotel_cash_multi_limit,	:airfare_cash_rate,	:airfare_cash_limit,	:airfare_cash_multi_limit,
    :other_cash_rate,	:other_cash_limit,	:other_cash_multi_limit)
  end

end
