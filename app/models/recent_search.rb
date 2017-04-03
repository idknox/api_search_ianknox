class RecentSearch < ApplicationRecord

  validates_presence_of :keyword,
                       :search_count

  validates_uniqueness_of :keyword
end
