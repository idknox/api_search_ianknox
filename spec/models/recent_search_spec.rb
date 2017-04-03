require 'rails_helper'

describe RecentSearch do
  describe 'validations' do
    it 'should validate present of keyword' do
      subject.valid?

      expect(subject.errors[:keyword]).to include("can't be blank")
    end

    it 'should validate present of search_count' do
      subject.search_count = nil

      subject.valid?

      expect(subject.errors[:search_count]).to include("can't be blank")
    end

    it 'should validate uniqueness of keyword' do
      RecentSearch.create(keyword: 'test')
      subject.keyword = 'test'

      subject.valid?

      expect(subject.errors[:keyword]).to include("has already been taken")
    end
  end
end