class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable
  validates :name, presence: true, length: {maximum: 15}, format: { with: /\A[a-z0-9-]+\z/i, message: "is must NOT contain any other characters than alphanumerics." }
end
