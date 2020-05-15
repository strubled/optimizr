class StaticPagesController < ApplicationController


  def home
    @all_cards = Card.all
  end

  

  def help
  end
end
