class PagesController < ApplicationController
  def home
		@title = "Welcome"
		if user_signed_in?
			redirect_to user_path(current_user)
		end
  end

  def settings
  end

end
