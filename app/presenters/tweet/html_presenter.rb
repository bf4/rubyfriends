class Tweet::HtmlPresenter
  attr_accessor :tweet

  def initialize(tweet)
    self.tweet = tweet
  end

  def self.model_name
    Tweet.model_name
  end

  # escape unsafe html and linkify for display
  def text
    buffer = ActiveSupport::SafeBuffer.new
    buffer << tweet.tweet_text
    buffer = TweetHelper.tweet_display_text(buffer)
    buffer
  end

  def url
    TweetHelper.twitter_status_url(tweet.username, tweet.tweet_id)
  end

  def username
    "@#{tweet.username}"
  end

  def tweet_id
    tweet.tweet_id.to_i
  end

  def method_missing(*arguments, &block)
    method_sym = Array(arguments).first
    if tweet.respond_to?(method_sym)
      tweet.send(*arguments, &block)
    else
      super
    end
  end

end
