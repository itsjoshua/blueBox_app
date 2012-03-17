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
#		@host.ram_capacity = @host.ram
#		@host.disk_capacity = @host.disk_size
		@host.total_ram = 0
		@host.total_disk_size = 0
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
#		old_ram = @host.ram
#		old_ram_capacity = @host.ram_capacity
#		old_disk_size = @host.disk_size
#		old_disk_capacity = @host.disk_capacity
		if @host.update_attributes(params[:host])
#			new_ram_capacity = find_capacity(old_ram, @host.ram, old_ram_capacity)
#			new_disk_capacity = find_capacity(old_disk_size, @host.disk_size, old_disk_capacity)
#			@host.update_attributes(:disk_capacity => new_disk_capacity, :ram_capacity => new_ram_capacity)
			redirect_to user_path(@user),
			:notice => "Successfully edited #{@host.name}!"
		else
			render :action => :edit
		end
  end

	def show
		@title = "Hosts"
		@host = Host.find(params[:id])
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
	
#	def find_capacity(old_size, new_size, old_capacity)
#		if new_size >= old_size
#			old_capacity + (new_size - old_size)
#		else
#			old_capacity - (old_size - new_size)
#		end
#	end

end
