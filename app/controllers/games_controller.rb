require "json"
require "open-uri"
require "uri"

class GamesController < ApplicationController
  def new
    voyelles = %w[A E I O U]
    @letters = voyelles.sample(3) + ("A".."Z").to_a.sample(7) # + consonnes.sample(7)
    @letters.shuffle!

    # @letters = ("A".."Z").to_a.sample(10)

    # consonnes = ('A'..'Z').to_a - voyelles
    # @letters += Array.new(7) { (('A'..'Z').to_a - voyelles).sample }
    # @letters.shuffle!
  end

  def shuffle
    @letters.shuffle!
  end

  def score
    # raise
    # @letters = params[:letters]
    # @word = params[:word]

    # récupérer les lettres générées
    @letters = params[:letters].split
    # récupérer les lettres écrites par le USER
    @word = (params[:word] || "").upcase
    # comparer les lettres
    @compare = compare?(@word, @letters)
    # mot max-length = 10
    # vérifier si le mot est valide avec l'API
    @url = "https://dictionary.lewagon.com/#{:word}"
    @valid = valid?(@word)
    # message valide
    # if !valid?
    #   @message = "No match !"
    # # ou message invalide
    # elsif !valid?
    #   @message = "Invalid word ! 👎"
    # else
    #   @message = "Well done ! 👍"
    # end

    # afficher le mot choisit
    # @yourWord = params[:word]
    # calculer le score
    # @score
    # calculer le temps de réponse
    # @time
    # recommencer avec les mêmes lettres de base
    # ou new game
  end

  private

  def valid?(word)
    url = URI("https://dictionary.lewagon.com/#{word}")
    response = URI.open(url).read
    json = JSON.parse(response)
    json['found']
  end

  def compare?(word, letters)
    word.chars.all? { |letter| word.count(letter) <= letters.count(letter) }
  end
end
