require 'rails_helper'

describe SoundcloudSearch do

  describe '#initialize' do
    it 'saves the search' do
      allow_any_instance_of(SoundcloudService).to receive(:search_api) { [] }
      expect(RecentSearch.count).to eq(0)

      described_class.new(q: 'test')

      expect(RecentSearch.first.keyword).to eq('test')
    end

    it 'searches tracks, playlists, and users from the API' do
      expect_any_instance_of(SoundcloudService).to receive(:search_api).with('/tracks', q: 'test') { [] }
      expect_any_instance_of(SoundcloudService).to receive(:search_api).with('/playlists', q: 'test') { [] }
      expect_any_instance_of(SoundcloudService).to receive(:search_api).with('/users', q: 'test') { [] }

      described_class.new(q: 'test')
    end
  end

  describe 'results' do
    it 'returns the API search results' do
      allow_any_instance_of(SoundcloudService).to receive(:search_api) { ['test_result'] }

      expect(described_class.new(q: 'test').results).to eq(['test_result', 'test_result', 'test_result'])
    end
  end
end
