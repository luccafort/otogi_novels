class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable
  validates :name, presence: true, length: {maximum: 15},
            format: { with: /\A[a-z0-9-]+\z/i, message: "is must NOT contain any other characters than alphanumerics." }

  def self.find_omniauth(auth)
    Account.where(provider: auth.provider, uid: auth.uid).first
  end

  def self.new_with_session(params, session)
    super.tap do |account|
      if data = session["devise.facebook_daa"] && session["devise.facebook_data"]["extra"]["raw_info"]
        account.email = data["email"] if account.email.blank?
      end

      if data = session["devise.facebook_data"]
        account.provider = data["provider"] if account.provider.blank?
        account.uid      = data["uid"] if account.uid.blank?
        account.password = Devise.friendly_token[0, 20] if account.password.blank?
      end
    end
  end

end
