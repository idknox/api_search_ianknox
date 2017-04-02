class SearchPage
  def initialize(query)
    @search = SoundcloudSearch.new(query)
  end

  def results
    @results ||= @search.results
  end

  def recent_searches
    @recent ||= RecentSearch.order(updated_at: :desc)
  end
end