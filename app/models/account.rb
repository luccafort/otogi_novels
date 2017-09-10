class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  attr_accessible :name, :password, :uid, :provider

  def self.new_with_session(params, session)
    super.tap do |account|
      if data = session["devise.facebook_data"] && session["device.facebook_data"]["extra"]["raw_info"]
        account.email = data['email']
      end
    end
  end

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    account = Account.where(:provider => auth.provider, :uid => auth.uid).first
    unless account
      # アカウント情報がない場合新規作成
      account = Account.create(
                           name:auth.extra.raw_info.name,
                           provider:auth.provider,
                           email:auth.info.email,
                           password:Devise.friendly_token[0, 20]
      )
    end
    account
  end

  def self.find_for_twitter_oauth(auth, signed_in_resource=nil)
    account = Account.where(:provider => auth.provider, :uid => auth.uid).first
    unless account
      account = Account.create(
                           name:auth.exra.raw_info.name,
                           provider:auth.provider,
                           uid:auth.uid,
                           #Twitterではemailは取得できない(Twitter側の仕様)
#                           email:auth.extra.user_hash.email,
                           password:Devise.friendly_token[0, 20]
      )
    end
    account
  end
end
