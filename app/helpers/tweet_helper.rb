module TweetHelper
  extend self

  def twitter_url(term = TWEET_SEARCHER.default_hashtag)
    "https://twitter.com/#!/#{term}"
  end

  def twitter_status_url(username, tweet_id)
    "https://twitter.com/#{username}/status/#{tweet_id}"
  end

  def total_tweets
    tweets.count
  end

  # returns the highest tweet_id in the collection as a string
  def max_tweet_id(paged_tweets)
    paged_tweets.max {|a,b| a.tweet_id.to_i <=> b.tweet_id.to_i }.tweet_id.to_s
  end

  def presented_tweets(tweets)
    tweets.map { |tweet| Tweet::HtmlPresenter.new(tweet) }
  end

  def tweet_display_text(text)
    text = link_urls(text)
    text = link_hashtags(text)
    text = link_usernames(text)
    text
  end

  def link_urls(text)
    text.gsub(/(https?[^\s]+)/o,
                      %q(<a href="\\1" target="_blank">\\1</a>)
             )
  end

  def link_hashtags(text)
    text.gsub(/#(\w+)/,
              '<a href="http://twitter.com/search?q=%23\\1">#\\1</a>'
             )
  end

  def link_usernames(text)
    text.gsub(/@(\w+)/,
              '<a href="http://twitter.com/\\1">@\\1</a>'
             )
  end

  private

  def tweets
    Tweet.published
  end

end
