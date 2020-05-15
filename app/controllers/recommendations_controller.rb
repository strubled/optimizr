class RecommendationsController < ApplicationController

  def reco
      @cards = Card.all
      #@spend = Comment.new(spend: cookies[:spend])
      #@spend = Spent.where(id: 4).select(:spend)
      #@spend = spend_params
      #@spend = Spent.find(Spent.count).spend
      if session[:total] == nil
        @grocery = 1000
        @total = 4000
      else
        @grocery = session[:grocery].to_f
        @total = session[:total].to_f
      end

  end

  def create
  #@spend = spend_params
  @grocery = spend_params[:grocery]
  @total = spend_params[:total]
  #@spend = Spent.new(spend_params)
  #@spend.save
  session[:grocery] = spend_params[:grocery]
  session[:total] = spend_params[:total]
  redirect_to(recommendations_path(spend: @spend))
  #redirect_to request.referrer
  #cookies[:spend] = params[:spend]

  #redirect_to @spend
  end


private
  def spend_params
    params.require(:spend).permit(:total, :grocery)
  end

end
