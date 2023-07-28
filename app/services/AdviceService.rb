require 'net/http'

class AdviceService
  BASE_URL = 'https://api.adviceslip.com/advice'.freeze

  def self.get_random_advice
    uri = URI(BASE_URL)
    response = Net::HTTP.get_response(uri)
    
    if response.is_a?(Net::HTTPSuccess)
      advice = JSON.parse(response.body)
      return advice['slip']['advice']
    else
      return 'Unable to fetch advice at the moment. Please try again later.'
    end
  end
end