class Accounts::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end
  def twitter
    # ユーザ登録まで自動的に実施せず、ユーザ検索のみ実施するように変更
    # メソッドはuser.rb側で定義します。
    @account = Account.find_omniauth(request.env["omniauth.auth"])

    # persisted?メソッドで参照できるはずだが現在エラーになる、調査のため一時的にif文条件を変更
    if @account
      sign_in_and_redirect @account
      set_flash_message(:notice, :success, :kind => "Twitter") if is_navigational_format?
    else
      # Twitterから取得した情報をsessionに格納
      session["devise.twitter_data"] = request.env["omniauth.auth"].except("extra")
      # 新規ユーザの場合、`ユーザ名`登録用のテンプレートをrender
      @account = Account.new()
      render 'devise/registrations/new'
    end
  end

  def facebook
    # ユーザ登録まで自動的に実施せず、ユーザ検索のみ実施するように変更
    # メソッドはuser.rb側で定義します。
    @account = Account.find_omniauth(request.env["omniauth.auth"])

    # persisted?メソッドで参照できるはずだが現在エラーになる、調査のため一時的にif文条件を変更
    if @account
      sign_in_and_redirect @account
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      # Facebookから取得した情報をsessionに格納
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      # 新規ユーザの場合、`ユーザ名`登録用のテンプレートをrender
      @account = Account.new()
      render 'devise/registrations/new'
    end
  end

  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end
  def failure
    redirect_to root_path
  end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end
