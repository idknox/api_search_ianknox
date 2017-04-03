class SoundcloudSearch

  attr_reader :results

  def initialize(query)
    @query = query
    service = SoundcloudService.new
    @results = service.search_results(@query)
    save_search
  end

  private

  def save_search
    recent_search = RecentSearch.find_or_initialize_by(keyword: @query)
    recent_search.update(search_count: recent_search.search_count + 1)
  end
end