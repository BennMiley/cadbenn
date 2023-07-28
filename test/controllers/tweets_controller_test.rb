require 'test_helper'

class TweetsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one) # Replace "one" with the fixture name for a user record
    @tweet = tweets(:one) # Replace "one" with the fixture name for a tweet record
  end

  test 'should get index' do
    get tweets_url
    assert_response :success
  end

  test 'should get show' do
    get tweet_url(@tweet)
    assert_response :success
  end

end