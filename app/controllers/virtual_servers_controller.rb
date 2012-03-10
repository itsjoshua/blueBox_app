class VirtualServersController < ApplicationController
	before_filter :authenticate_user!

  def new
		@title = "New virtual server"
		@user = current_user
		@host = Host.find(params[:host_id])
		@virtual_server = @user.hosts.find(@host).virtual_servers.new
  end

	def create
		@title = "New virtual server"
		@user = current_user
		@virtual_server = Host.find(params[:host_id]).virtual_servers.build(params[:virtual_server])
		@virtual_server.save
		redirect_to user_path(@user)
	end

  def edit
		@title = "Edit virtual server"
		@user = current_user
		@host = Host.find(params[:host_id])
		@virtual_server = @host.virtual_servers.find(params[:id])
  end

  def update
		@title = "Edit virtual server"
		@host = Host.find(params[:host_id])
		@virtual_server = @host.virtual_servers.find(params[:id])
		if @virtual_server.update_attributes(params[:virtual_server])
			redirect_to user_path(@user),
			:notice => "Successfully edited #{@virtual_server.name}!"
		else
			render :action => :edit
		end
  end

  def destroy
#		@user = current_user
		@host = Host.find(params[:host_id])
		@virtual_server = @host.virtual_servers.find(params[:id])
		@virtual_server.destroy
		redirect_to user_path(@user)
  end

end
