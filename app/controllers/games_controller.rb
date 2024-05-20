class GamesController < ApplicationController
  def new
    # @letters = ("A".."Z").to_a.sample(10)
    voyelles = %w[A E I O U]
    # consonnes = ('A'..'Z').to_a - voyelles
    @letters = voyelles.sample(3) + ("A".."Z").to_a.sample(7) # + consonnes.sample(7)
    @letters.shuffle!
    # @letters += Array.new(7) { (('A'..'Z').to_a - voyelles).sample }
    # @letters.shuffle!
  end
  def score
    # raise
    @word = params[:word]
    @letters = params[:letters]
  end
end
