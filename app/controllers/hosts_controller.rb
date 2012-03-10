class HostsController < ApplicationController
	
	before_filter :authenticate_user!
	before_filter :assign_user

  def new
		@title = "Add new host"
		@host = @user.hosts.new
  end

	def create
		@title = "Add new host"
		@host = @user.hosts.build(params[:host])
		if @host.save
			redirect_to user_path(@user)
		else
			render :action => :new
		end
	end

  def edit
		@title = "Edit host"
		@host = Host.find(params[:id])
  end

  def update
		@title = "Edit host"
		@host = Host.find(params[:id])
		if @host.update_attributes(params[:host])
			redirect_to user_path(@user),
			:notice => "Successfully edited #{@host.name}!"
		else
			render :action => :edit
		end
  end

  def destroy
		@host = Host.find(params[:id])
		@host.destroy
		redirect_to user_path(@user)
  end

	private 
	
	def assign_user
		@user = current_user
	end

end
