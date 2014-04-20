TWEET_SEARCHER = TwitterSearch.new(['RubyFriends', 'RubyFriend'])
class TweetAppConfig
  attr_accessor :hash_tags, :title
end
tweet_app           = TweetAppConfig.new
tweet_app.hash_tags = '#RubyFriends'
tweet_app.title     = '#RubyFriends'
Rails.application.config.tweet_app = tweet_app
