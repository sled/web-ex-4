class OmniauthCallbacksController < ApplicationController
  protect_from_forgery except: :twitter
  before_filter :authorize

  def twitter
    current_user.identities.twitter.destroy_all
    auth = request.env["omniauth.auth"]
    current_user.identities.twitter.create!(uid: auth.uid, 
      provider: auth.provider, 
      name: auth.info.name, 
      nickname: auth.info.nickname,
      token: auth.credentials.token,
      secret: auth.credentials.secret)

    redirect_to root_path, notice: 'Twitter Identity Added'
  end
end
