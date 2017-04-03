class SoundcloudService
  def initialize
    @client = SoundCloud.new(client_id: ENV['SOUNDCLOUD_CLIENT_ID'])
  end

  def search_api(path, q)
    begin
      @client.get(path, q: q)
    rescue SoundCloud::ResponseError
      []
    end
  end
end