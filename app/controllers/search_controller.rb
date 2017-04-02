class SearchController < ApplicationController
  def show
    @search_page = SearchPage.new(params[:q])
  end
end