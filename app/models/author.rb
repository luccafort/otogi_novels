class Author < ActiveRecord::Base
  has_many :novels, dependent: :destroy
end
