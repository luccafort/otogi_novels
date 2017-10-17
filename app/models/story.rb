class Story < ActiveRecord::Base
  belongs_to :novel_series
  accepts_nested_attributes_for :novel_series
  enum status: [no_entry: 0, draft: 100, publish: 200, limited: 300, deleted: 400, private: 500]
  validates :content, presence: true, length: {minimum: 100, maximum: 10000}
end
