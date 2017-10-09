class Stories < ActiveRecord::Base
  belongs_to :novel
  enum status: [no_entry: 0, draft: 100, publish: 200, limited: 300, deleted: 400, private: 500]
end
