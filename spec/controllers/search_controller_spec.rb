require 'rails_helper'

describe SearchController do
  describe 'GET show' do
    before do
      allow_any_instance_of(SoundcloudService).to receive(:search_api) { [] }
    end

    it 'assigns @search_page' do
      get :show

      expect(assigns(:search_page)).to be_a(SearchPage)
    end

    it 'renders the show template' do
      get :show
      expect(response).to render_template('show')
    end
  end
end