TWEET_SEARCHER = TwitterSearch.new(%w(RailsConf RubyConf RubyNation))
class TweetAppConfig
  attr_accessor :hash_tags, :title
end
tweet_app           = TweetAppConfig.new
tweet_app.hash_tags = '#RailsConf, #RubyConf, or #RubyNation'
tweet_app.title     = 'ConfTweets'
Rails.application.config.tweet_app = tweet_app
