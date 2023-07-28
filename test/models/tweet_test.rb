require 'test_helper'

class TweetTest < ActiveSupport::TestCase
  def setup
    @user = users(:one) # Replace "one" with the fixture name for a user record
    @tweet = Tweet.new(user: @user, content: 'Test tweet content')
  end

  test 'tweet should be valid' do
    assert @tweet.valid?
  end

  test 'user_id should be present' do
    @tweet.user_id = nil
    assert_not @tweet.valid?
  end

  test 'content should be present' do
    @tweet.content = ' '
    assert_not @tweet.valid?
  end

end