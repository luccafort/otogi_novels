class Novel < ActiveRecord::Base
  belongs_to :author
  has_many :contents, dependent: :destroy
  validates :title, presence: true, length: { minimum: 5 }
end
