class NovelSeries < ActiveRecord::Base
  has_many :stories, dependent: :destroy
  validates :title, presence: true, length: { minimum: 5 }
end
