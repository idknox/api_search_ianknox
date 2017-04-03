class SoundcloudSearch

  attr_reader :results

  def initialize(query)
    @query = query
    @service = SoundcloudService.new
    @results = search_results
    save_search
  end

  private

  def search_results
    tracks + playlists + users
  end

  def tracks
    @service.search_api('/tracks', @query)
  end

  def playlists
    @service.search_api('/playlists', @query)
  end

  def users
    @service.search_api('/users', @query)
  end

  def save_search
    recent_search = RecentSearch.find_or_initialize_by(keyword: @query)
    recent_search.update(search_count: recent_search.search_count + 1)
  end
end