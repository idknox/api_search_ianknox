require 'rails_helper'

describe SearchPage do
  let(:subject) { described_class.new('test') }

  describe '#results' do
    it 'returns the SoundcloudSearch results' do
      allow_any_instance_of(SoundcloudService).to receive(:search_api) { [] }
      allow_any_instance_of(SoundcloudSearch).to receive(:results) { ['test_result'] }

      expect(subject.results).to eq(['test_result'])
    end
  end

  describe 'grouped_results' do
    it 'groups results by kind' do
      test_results =[
        {
          kind: 'track',
          title: 'test1'
        },
        {
          kind: 'playlist',
          title: 'test2'
        },
        {
          kind: 'user',
          username: 'test3'
        }
      ]

      allow_any_instance_of(SoundcloudService).to receive(:search_api) { [] }
      allow_any_instance_of(SoundcloudSearch).to receive(:results) { test_results }

      expect(subject.grouped_results['track'].count).to eq(1)
      expect(subject.grouped_results['playlist'].count).to eq(1)
      expect(subject.grouped_results['user'].count).to eq(1)
    end
  end

  describe '#recent_searches' do
    it 'finds all recent searches' do
      search1 = RecentSearch.create(keyword: 'test1')
      search2 = RecentSearch.create(keyword: 'test2')
      allow(SoundcloudSearch).to receive(:new)

      expect(subject.recent_searches.first).to eq(search2)
      expect(subject.recent_searches.last).to eq(search1)
    end
  end
end