class RecommendationsController < ApplicationController

  def reco
      @cards = Card.all
      if session[:grocery] == nil
        @grocery = 1500
        @gas = 50
        @dining = 200
        @airfare = 400
        @hotel = 200
        @other = 1000
        @total = 3350
        @countnil = 0
else

  @grocery = session[:grocery].to_f
  @gas = session[:gas].to_f
  @dining = session[:dining].to_f
  @airfare = session[:airline].to_f
  @hotel = session[:hotel].to_f
  @other = session[:other].to_f
  @total = (@grocery + @gas + @dining + @airfare + @hotel + @other).to_f

  @allvalues = [@grocery, @gas, @dining, @airfare, @hotel, @other].tally
  @countnil = @allvalues[0].to_f
  if @countnil == 0
    @countnil = 1
  end

        @groceryhash = Hash.new
        @gashash = Hash.new
        @dininghash = Hash.new
        @hotelhash = Hash.new
        @airfarehash = Hash.new
        @otherhash = Hash.new
        @cards.each do |card|
          @groceryhash[card.name] = (card.grocery_cash_rate * @grocery / 100) +
                                  (card.grocery_points_multi * @grocery / 100) -
                                  (card.annual_fee / @countnil)

          @gashash[card.name] = (card.gas_cash_rate * @gas / 100) +
                              (card.gas_points_multi * @gas / 100) -
                              (card.annual_fee / @countnil)

          @dininghash[card.name] = (card.dining_cash_rate * @dining / 100) +
                                    (card.dining_point_multi * @dining / 100) -
                                    (card.annual_fee / @countnil)
          @hotelhash[card.name] = (card.hotel_cash_rate * @hotel / 100) +
                                    (card.hotel_points_multi * @hotel /100) -
                                    (card.annual_fee / @countnil)
          @airfarehash[card.name] = (card.airfare_cash_rate * @airfare / 100) +
                                    (card.airfare_points_multi * @airfare / 100) -
                                    (card.annual_fee / @countnil)
          @otherhash[card.name] = (card.other_cash_rate * @other / 100) +
                                    (card.other_points_multi * @other / 100) -
                                    (card.annual_fee / @countnil)
       end

        @topgrocery = @groceryhash.max_by{|k,v| v}[0]
        @topgas = @gashash.max_by{|k,v| v}[0]
        @topdining = @dininghash.max_by{|k,v| v}[0]
        @tophotel = @hotelhash.max_by{|k,v| v}[0]
        @topairfare = @airfarehash.max_by{|k,v| v}[0]
        @topother = @otherhash.max_by{|k,v| v}[0]
  end
end

  def create

  session[:grocery] = spend_params[:grocery]
  session[:gas] = spend_params[:gas]
  session[:dining] = spend_params[:dining]
  session[:airline] = spend_params[:airline]
  session[:hotel] = spend_params[:hotel]
  session[:other] = spend_params[:other]

  @spend = spend_params
  @grocery = spend_params[:grocery]
  @gas = spend_params[:gas]
  @dining = spend_params[:dining]
  @airfare = spend_params[:airline]
  @hotel = spend_params[:hotel]
  @other = spend_params[:other]
  @total = @grocery + @gas + @dining + @airfare + @hotel + @other
    redirect_to(recommendations_path(spend: @spend))

  end


private
  def spend_params
    params.require(:spend).permit(:grocery, :gas, :dining, :hotel, :airline, :other)
  end

end
