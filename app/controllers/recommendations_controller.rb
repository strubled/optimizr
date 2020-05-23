class RecommendationsController < ApplicationController

  def reco
      @cards = Card.all
      if current_user.transactions.any? == false
        @countnil = 0
        @grocery = 0
        @gas = 0
        @dining = 0
        @airfare = 0
        @hotel = 0
        @other = 0
        @total = 0
        @topgrocery = "None Yet"
        @topgas = "None Yet"
        @topdining = "None Yet"
        @topairfare = "None Yet"
        @tophotel = "None Yet"
        @topother = "None Yet"
        @topforall = "None Yet"
      else
        @trans = current_user.transactions
        @countnil = @trans.last.attributes.values.select(&:nil?).count - 2
        @grocery = (@trans.last.grocery).to_f
        @gas = (@trans.last.gas).to_f
        @dining = (@trans.last.dining).to_f
        @airfare = (@trans.last.airline).to_f
        @hotel = (@trans.last.hotel).to_f
        @other = (@trans.last.other).to_f
        @total = (@grocery + @gas + @dining + @airfare + @hotel + @other).to_f

        @groceryhash = Hash.new
        @gashash = Hash.new
        @dininghash = Hash.new
        @hotelhash = Hash.new
        @airfarehash = Hash.new
        @otherhash = Hash.new
        @cards.each do |card|
          @groceryhash[card.name] = (card.grocery_cash_rate * @grocery / 100) +
                                  (card.grocery_points_multi * @grocery / 100) -
                                  (card.annual_fee / (6-@countnil))

          @gashash[card.name] = (card.gas_cash_rate * @gas / 100) +
                              (card.gas_points_multi * @gas / 100) -
                              (card.annual_fee / (6-@countnil))

          @dininghash[card.name] = (card.dining_cash_rate * @dining / 100) +
                                    (card.dining_point_multi * @dining / 100) -
                                    (card.annual_fee / (6-@countnil))
          @hotelhash[card.name] = (card.hotel_cash_rate * @hotel / 100) +
                                    (card.hotel_points_multi * @hotel /100) -
                                    (card.annual_fee / (6-@countnil))
          @airfarehash[card.name] = (card.airfare_cash_rate * @airfare / 100) +
                                    (card.airfare_points_multi * @airfare / 100) -
                                    (card.annual_fee / (6-@countnil))
          @otherhash[card.name] = (card.other_cash_rate * @other / 100) +
                                    (card.other_points_multi * @other / 100) -
                                    (card.annual_fee / (6-@countnil))
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

    @spend = current_user.transactions.build(spend_params)
    @spend.save
    redirect_to(recommendations_path(spend: @spend))

  end


private
  def spend_params
    params.require(:spend).permit(:grocery, :gas, :dining, :hotel, :airline, :other)
  end

end
