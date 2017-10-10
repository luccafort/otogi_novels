class Story < ActiveRecord::Base
  belongs_to :novel_series
  enum status: [no_entry: 0, draft: 100, publish: 200, limited: 300, deleted: 400, private: 500]
end
