class CardsController < ApplicationController
  def new
      @cards = Card.all
  end

  def index
    @analysis = Card.all
  end

  def analysis
      @cards = Card.all
  end

  def delete
  end
end
