class TweetsController < ApplicationController
  require 'my_logger'
  require 'net/http'
  #Locking down tweet crud functionality unless youre signed in
  before_action :authenticate_user!, except: [:index, :show]

  # The tweet dashboard
  def index
    @tweets = Tweet.all
    @advice = fetch_advice
  end

  # The tweets belomnging to a given person
  def show
    @tweet = Tweet.find(params[:id])
  end

  # new tweet dashboard
  def new
    @tweet = current_user.tweets.new
  end

  # edit dasboard on existing tweet
  def edit
    @tweet = current_user.tweets.find(params[:id])
  end

  # post tweet
  def create
    @tweet = current_user.tweets.new(tweet_params)
    if @tweet.save
      redirect_to @tweet, notice: 'Tweet was successfully created.'

      logger = MyLogger.instance
      logger.logInfo("a new tweet was created; #{@tweet.content}")
    else
      render :new 
    end
  end

  # update tweet
  def update
    @tweet = current_user.tweets.find(params[:id])
    if @tweet.update(tweet_params)
      redirect_to @tweet, notice: 'Tweet was successfully updated.'
    else
      render :edit
    end
  end

  # delete tweet
  def destroy
    @tweet = current_user.tweets.find(params[:id])
    @tweet.destroy
    logger = MyLogger.instance
    logger.logInfo("a tweet was destroyed; #{@tweet.content}")
    redirect_to tweets_url, notice: 'Tweet was successfully destroyed.'
  end

  private

    # specifies what can be changed re tweet
    def tweet_params
      params.require(:tweet).permit(:content, :image)
    end

   def fetch_advice
    uri = URI('https://api.adviceslip.com/advice')

      http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE

  response = http.get(uri)
  advice_data = JSON.parse(response.body)
  advice_data['slip']['advice']
  end
end