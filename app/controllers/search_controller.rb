class SearchController < ApplicationController
  def show
    redirect_to root_path unless params[:q].present?
    @search_page = SearchPage.new(params[:q])
  end
end