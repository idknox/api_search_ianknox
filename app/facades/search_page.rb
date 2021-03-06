class SearchPage
  def initialize(opts)
    @search = SoundcloudSearch.new(opts)
  end

  def results
    @results ||= @search.results
  end

  def grouped_results
    @grouped ||= results.group_by {|result| result[:kind]}
  end

  def recent_searches
    @recent ||= RecentSearch.order(updated_at: :desc)
  end
end