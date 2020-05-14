class CardsController < ApplicationController
  def new
      @cards = Card.all
  end

  def delete
  end
end
