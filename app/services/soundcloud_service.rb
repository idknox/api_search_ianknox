class SoundcloudService
  def initialize
    @client = SoundCloud.new(:client_id => ENV['SOUNDCLOUD_CLIENT_ID'])
  end

  def search_all(query)
    @query = query
    tracks + playlists + users
  end

  private

  def tracks
    search_api('/tracks')
  end

  def playlists
    search_api('/playlists')
  end

  def users
    search_api('/users')
  end

  def search_api(path)
    @client.get(path, q: @query)
  end
end