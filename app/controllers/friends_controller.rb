class FriendsController < ApplicationController
  def index
    @friends = Tweet.published.first 20
  end

  def show
    @friends = Tweet.published.where(username: params[:id])
  end

  private

    helper_method :paginated_tweets
    def paginated_tweets
      @paginated_tweets ||= rubyfriends_app.paginated_tweets(params[:page])
    end

end
