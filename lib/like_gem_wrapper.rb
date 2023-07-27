require 'like_gem'

class LikeGemWrapper
  def initialize
    @like_gem = LikeGem::Like.new
  end

  def like(tweet_id, user_id)
    @like_gem.like(tweet_id, user_id)
  end

  def unlike(tweet_id, user_id)
    @like_gem.unlike(tweet_id, user_id)
  end

  def liked_by?(tweet_id, user_id)
    @like_gem.liked_by?(tweet_id, user_id)
  end

  def likes_count(tweet_id)
    @like_gem.likes_count(tweet_id)
  end
end