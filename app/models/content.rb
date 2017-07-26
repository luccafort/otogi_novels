class Content < ActiveRecord::Base
  enum status: [draft: 100, publish: 200, limited: 300, deleted: 400, private: 500]
end
