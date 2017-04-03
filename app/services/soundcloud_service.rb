class SoundcloudService
 DEFAULT_LIMIT = 100

  def initialize
    @client = SoundCloud.new(client_id: ENV['SOUNDCLOUD_CLIENT_ID'])
  end

  def search_api(path, opts)
    begin
      @client.get(path, q: opts[:q], limit: opts[:limit] || DEFAULT_LIMIT)
    rescue SoundCloud::ResponseError
      []
    end
  end
end