require 'rails_helper'

describe SoundcloudService do
  describe '#search_api' do
    it 'searches the soundcloud api' do
      allow_any_instance_of(SoundCloud::Client).to receive(:get) { ['test_result'] }

      expect(subject.search_api('/test', '')).to eq(['test_result'])
    end
  end
end