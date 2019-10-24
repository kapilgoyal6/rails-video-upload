class Users::OmniauthController < ApplicationController

	def google_oauth2
		@authentication = Authentication.create_from_google_data(request.env['omniauth.auth'], current_user.id)
	  if @authentication.persisted?
	    redirect_to new_video_url
	  else
	    flash[:error] = 'There was a problem signing you in through Google. Please register or try signing in later.'
	    redirect_to new_video_url
	  end
	end
end
