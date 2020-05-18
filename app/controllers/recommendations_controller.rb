class RecommendationsController < ApplicationController

  def reco
      @cards = Card.all
      #@spend = Comment.new(spend: cookies[:spend])
      #@spend = Spent.where(id: 4).select(:spend)
      #@spend = spend_params
      #@spend = Spent.find(Spent.count).spend
      if session[:grocery] == nil
        @grocery = 1500
        @gas = 50
        @dining = 200
        @airfare = 400
        @hotel = 200
        @other = 1000
      else
        @grocery = session[:grocery].to_f
        @gas = session[:gas].to_f
        @dining = session[:dining].to_f
        @airfare = session[:airfare].to_f
        @hotel = session[:hotel].to_f
        @other = session[:other].to_f
      end

  end

  def create
  #@spend = spend_params
  @grocery = spend_params[:grocery]
  @gas = spend_params[:gas]
  @dining = spend_params[:dining]
  @airfare = spend_params[:airfare]
  @hotel = spend_params[:hotel]
  @other = spend_params[:other]
  #@spend = Spent.new(spend_params)
  #@spend.save
  session[:grocery] = spend_params[:grocery]
  session[:gas] = spend_params[:gas]
  session[:dining] = spend_params[:dining]
  session[:airfare] = spend_params[:airfare]
  session[:hotel] = spend_params[:hotel]
  session[:other] = spend_params[:other]
  redirect_to(recommendations_path(spend: @spend))
  #redirect_to request.referrer
  #cookies[:spend] = params[:spend]

  #redirect_to @spend
  end


private
  def spend_params
    params.require(:spend).permit(:grocery, :gas, :dining, :hotel, :airfare, :other)
  end

end
