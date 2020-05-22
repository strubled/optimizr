class RecommendationsController < ApplicationController

  def reco
      @cards = Card.all
      @trans = Transaction.all

      #@category = [Transaction.last.grocery, Transaction.last.gas, Transaction.last.dining,
      #  Transaction.last.airline, Transaction.last.other, Transaction.last.hotel]
      #@categoriesEntered = Hash.new(0)
      #@category.each { |v| @categoriesEntered.store(v, @category[v]+1)}
      @countnil = Transaction.last.attributes.values.select(&:nil?).count - 2
      @spend = current_user.feed
      if Transaction.last.grocery == nil
        @grocery = 0
      else
      @grocery = (Transaction.last.grocery).to_f
    end
      if Transaction.last.gas == nil
        @gas = 0
      else
      @gas = (Transaction.last.gas).to_f
    end
    if Transaction.last.dining == nil
      @dining = 0
    else
    @dining = (Transaction.last.dining).to_f
  end
        if Transaction.last.airline == nil
          @airfare = 0
        else
        @airfare = (Transaction.last.airline).to_f
      end
      if Transaction.last.hotel== nil
        @hotel = 0
      else
      @hotel = (Transaction.last.hotel).to_f
      end
      if Transaction.last.other== nil
        @other = 0
      else
      @other = (Transaction.last.other).to_f
      end

      @total = (@grocery + @gas + @dining + @airfare + @hotel + @other).to_f
      @groceryhash = Hash.new
      @gashash = Hash.new
      @cards.each do |card|
        @groceryhash[card.name] = (card.grocery_cash_rate * @grocery / 100) +
                                  (card.grocery_points_multi * @grocery / 100) -
                                  (card.annual_fee / (6-@countnil))

        @gashash[card.name] = (card.gas_cash_rate * @gas / 100) +
                              (card.gas_points_multi * @gas / 100) -
                              (card.annual_fee / (6-@countnil))
        end
        # Annual Fee will have to find how many times each card wins,
        # for any that win 1x, subtract annual fee, assign that new value to the Hash
        # then redo the max lookup
        # for any that win > 1, divide annual fee by number of times it won, sutract
        # that new divided fee from their totals, assign that new value to the Hash
        # then redo the max lookup
        # step 1: create aan array of the top winners
        @topgrocery = @groceryhash.max_by{|k,v| v}[0]
        @topgas = @gashash.max_by{|k,v| v}[0]
        @winners = [@topgas, @topgrocery]
        # step 2: count how many times something pops
        #@counts = @winners.group_by{|i| i}.map{|k,v| [k, v.count] }
        #@countsHash = Hash[@counts.flatten]


      @please = @topgrocery
      #@spend = spend_params
      #@spend = Spent.find(Spent.count).spend
      #if session[:grocery] == nil
        #@grocery = 1500
        #@gas = 50
        #@dining = 200
        #@airfare = 400
        #@hotel = 200
        #@other = 1000
        #@total = 3350
      #else
        #@grocery = session[:grocery].to_f
        #@gas = session[:gas].to_f
        #@dining = session[:dining].to_f
        #@airfare = session[:airfare].to_f
        #@hotel = session[:hotel].to_f
        #@other = session[:other].to_f
        #@total = (@grocery + @gas + @dining + @airfare + @hotel + @other).to_f


  end

  def create
  #@spend = spend_params
  #@grocery = spend_params[:grocery]
  #@gas = spend_params[:gas]
  #@dining = spend_params[:dining]
  #@airfare = spend_params[:airfare]
  #@hotel = spend_params[:hotel]
  #@other = spend_params[:other]
  #@total = @grocery + @gas + @dining + @airfare + @hotel + @other
  @spend = current_user.transactions.build(spend_params)
  @spend.save

  #session[:grocery] = spend_params[:grocery]
  #session[:gas] = spend_params[:gas]
  #session[:dining] = spend_params[:dining]
  #session[:airfare] = spend_params[:airfare]
  #session[:hotel] = spend_params[:hotel]
  #session[:other] = spend_params[:other]
  redirect_to(recommendations_path(spend: @spend))
  #redirect_to request.referrer
  #cookies[:spend] = params[:spend]

  #redirect_to @spend
  end


private
  def spend_params
    params.require(:spend).permit(:grocery, :gas, :dining, :hotel, :airline, :other)
  end

end
