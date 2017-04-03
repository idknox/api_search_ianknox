class SearchController < ApplicationController
  def show
    redirect_to root_path unless params[:q].present?
    @search_page = SearchPage.new(q: params[:q], limit: params[:limit])
  end
end