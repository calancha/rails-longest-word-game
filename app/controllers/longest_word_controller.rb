require 'open-uri'
require 'json'

class LongestWordController < ApplicationController
  def play
    allowed_letters = ('A'..'Z').to_a
    @inputWords = []
    9.times { @inputWords << allowed_letters.sample }
    # raise "#{@inputWords}"
  end

  def inGrid?(word, grid)
    word && word.upcase.split('').all? { |letter| grid.include?(letter) }
  end

  def showResult
    # Start with someting simple: ignore the time.
    @trial = params[:userWord]
    api_uri = 'https://wagon-dictionary.herokuapp.com/' << @trial
    replay = open(api_uri).read
    # Word is in grid and does exist in the dictonary
    inputWords = params[:inputWords]

    if (inGrid?(@trial, inputWords) && (JSON.parse(replay))['found'])
      @score = 10 * @trial.length
    else
      @score = nil
    end
  end
end
