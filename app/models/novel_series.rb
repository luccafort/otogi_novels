class NovelSeries < ActiveRecord::Base
  has_many :stories, dependent: :destroy
  validates :title, length: { minimum: 5 }
end
