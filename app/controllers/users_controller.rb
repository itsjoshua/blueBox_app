class UsersController < ApplicationController
	before_filter :authenticate_user!

  def new
  end

  def show
		@user = current_user
		@title = "Home Page"

  end

  def edit
		
  end

  def update
  end

  def destroy
  end

end
