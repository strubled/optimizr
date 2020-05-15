class RecommendationsController < ApplicationController


  def reco
      @cards = Card.all
      #@spend = Comment.new(spend: cookies[:spend])
      #@spend = Spent.where(id: 4).select(:spend)

      @spend = Spent.find(Spent.count).spend

  end

  def create

  @spend = Spent.new(spend_params)
  @spend.save
  redirect_to request.referrer
  #cookies[:spend] = params[:spend]

  #redirect_to @spend
  end


private
  def spend_params
    params.require(:spend).permit(:spend)
  end

end
