require_relative 'html_presenter'
class Tweet::FeedPresenter < Tweet::HtmlPresenter

  extend Forwardable
  def_delegators  :@tweet,
    :updated_at,
    :tweet_text,
    :media_url

  def self.model_name
    Tweet.model_name
  end

  def id
    tweet.tweet.id
  end

  def to_param
    tweet.tweet.to_param
  end

  def author
    username
  end

  def content
    <<-HTML.gsub /^ {6}/, ''
      #{tweet_text}
      <br />
      <img src="#{media_url}" />
    HTML
  end

  def title
    "#{username}: #{tweet_text}".truncate 50
  end

  def username
    "@#{tweet.username}"
  end

end
