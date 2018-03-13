class OmniauthCallbacksController < ApplicationController
  def google_oauth2
      # You need to implement the method below in your model (e.g. app/models/user.rb)
      @user = User.find_for_google_oauth2(request.env['omniauth.auth'], current_user)

      if @user
        sign_in_and_redirect @user, event: :authentication
      else
        redirect_to root_path, alert: 'Only gapintelligence.com emails are permitted.'
      end
  end
end
