
class Accounts::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # FacebookのCallback APIの受け先
  def facebook
    @account = Account.find_for_facebook_oauth(request.env["omniauth.auth"], current_account)
    # アカウント情報が保存済みかどうか判定
    if @account.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Facebook"
      sign_in_and_redirect @account, :event => :authentication
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to_new_account_registration_url
    end
  end

  # TwitterのCallback APIの受け先
  def twitter
    @account = Account.find_for_twitter_oauth(request.env["omniauth.auth"], current_account)
    if @account.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Twitter"
      sign_in_and_redirect @account, :event => :authentication
    else
      session["devise.twitter_data"] = request.env["omniauth.auth"]
      redirect_to_new_account_registration_url
    end
  end
end