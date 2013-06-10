class TweetsController < ApplicationController

  def index
    @paged_tweets = paginated_tweets(page_number)
  end

  def show
    @tweet = Tweet.find(params[:id])
    render layout: false
  end

  def page_number
    page = params[:page].to_i
    page.zero? ? 1 : page
  end

  def paginated_tweets(params = params[:page])
    Tweet.published.page(params).per(20)
  end

end
