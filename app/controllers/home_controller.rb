class HomeController < ApplicationController

  def show
    @recent_searches = RecentSearch.order(updated_at: :desc)
  end
end