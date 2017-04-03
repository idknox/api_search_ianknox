require 'rails_helper'

describe HomeController do
  describe 'GET show' do
    it 'assigns @recent_searches' do
      search = RecentSearch.create!(keyword: 'test')

      get :show
      expect(assigns(:recent_searches)).to eq([search])
    end

    it 'renders the show template' do
      get :show
      expect(response).to render_template('show')
    end
  end
end