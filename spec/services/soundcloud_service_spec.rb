require 'rails_helper'

describe SoundcloudService do
  describe '#search_api' do
    it 'searches the soundcloud api' do
      allow_any_instance_of(SoundCloud::Client).to receive(:get) { ['test_result'] }

      expect(subject.search_api('/test', q: '')).to eq(['test_result'])
    end

    it 'default to limit of 100' do
      expect_any_instance_of(SoundCloud::Client).to receive(:get).with('/test', q: 'test', limit: 100)

      subject.search_api('/test', q: 'test')
    end

    it 'can receive a limit' do
      expect_any_instance_of(SoundCloud::Client).to receive(:get).with('/test', q: 'test', limit: 50)

      subject.search_api('/test', q: 'test', limit: 50)
    end
  end
end