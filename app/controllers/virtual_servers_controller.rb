class VirtualServersController < ApplicationController
	before_filter :authenticate_user!
	# need another before_filter to initialize user, host

  def new
		@title = "New virtual server"
		@user = current_user
		@host = Host.find(params[:host_id])
		@virtual_server = @user.hosts.find(@host).virtual_servers.new
  end

	def create
		@title = "New virtual server"
		@user = current_user
		@host = Host.find(params[:host_id])
		@virtual_server = @host.virtual_servers.build(params[:virtual_server])
		if @virtual_server.save
#			new_ram_capacity = @host.ram_capacity - @virtual_server.ram
#			new_disk_capacity = @host.disk_capacity - @virtual_server.disk_size
#			@host.update_attributes(:disk_capacity => new_disk_capacity, :ram_capacity => new_ram_capacity)
			@host.update_attributes(:total_ram => (@host.total_ram + @virtual_server.ram), :total_disk_size => (@host.total_disk_size + @virtual_server.disk_size))
			redirect_to user_path(@user)
		else
			render :action => :new
		end
	end

  def edit
		@title = "Edit virtual server"
		@user = current_user
		@host = Host.find(params[:host_id])
		@virtual_server = @host.virtual_servers.find(params[:id])
  end

  def update
		@title = "Edit virtual server"
		@user = current_user
		@host = Host.find(params[:host_id])
		@virtual_server = @host.virtual_servers.find(params[:id])
		old_ram = @virtual_server.ram
		old_disk_size = @virtual_server.disk_size
		if @virtual_server.update_attributes(params[:virtual_server])
			@host.update_attributes(:total_ram => (@host.total_ram + (@virtual_server.ram - old_ram)), :total_disk_size => (@host.total_disk_size + (@virtual_server.disk_size - old_disk_size)))
			redirect_to user_path(@user),
			:notice => "Successfully edited #{@virtual_server.name}!"
		else
			render :action => :edit
		end
  end

  def destroy
		@user = current_user
		@host = Host.find(params[:host_id])
		@virtual_server = @host.virtual_servers.find(params[:id])
		@virtual_server.destroy
		redirect_to user_path(@user)
  end

end
