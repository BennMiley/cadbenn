require 'httparty'
class PagesController < ApplicationController
  def home
    @joke_text = ChuckNorrisService.get_joke
  end
end
