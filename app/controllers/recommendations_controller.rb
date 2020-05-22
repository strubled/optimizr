class RecommendationsController < ApplicationController

  def reco
      @cards = Card.all
      if Transaction.any? == false
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
      else
        @trans = Transaction.all
        @countnil = Transaction.last.attributes.values.select(&:nil?).count - 2
        @grocery = (Transaction.last.grocery).to_f
        @gas = (Transaction.last.gas).to_f
        @dining = (Transaction.last.dining).to_f
        @airfare = (Transaction.last.airline).to_f
        @hotel = (Transaction.last.hotel).to_f
        @other = (Transaction.last.other).to_f
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

        @topgrocery = @groceryhash.max_by{|k,v| v}[0]
        @topgas = @gashash.max_by{|k,v| v}[0]
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
