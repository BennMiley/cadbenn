class ChuckNorrisService
  include HTTParty

  base_uri 'https://api.chucknorris.io'
  format :json
  default_options.update(verify: false)

  def self.get_joke
    response = get('/jokes/random')
    if response.success?
      joke = JSON.parse(response.body)
      return joke['value']
    else
      return nil
    end
  end
end