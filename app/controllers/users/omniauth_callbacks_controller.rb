class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_filter :authenticate

  def google_apps
    auth_hash = request.env['omniauth.auth']
    email = auth_hash.info['email']

    user = User.find_by_email(email)
    user ||= User.create!(email: email)

    if user.persisted?
      if iphone?
        redirect_to 'drama://' + user.authentication_token
      else
        sign_in_and_redirect user
      end
    end
  end

  def crowdint
    redirect_to user_omniauth_authorize_path :google_apps
  end
end

