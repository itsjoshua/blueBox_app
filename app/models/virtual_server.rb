# == Schema Information
# Schema version: 20120310233053
#
# Table name: virtual_servers
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  ram        :integer
#  disk_size  :integer
#  host_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class VirtualServer < ActiveRecord::Base
	belongs_to :host

	attr_accessible :name, :ram, :disk_size
	validates :name, :presence => true, :length => { :maximum => 15 }, :uniqueness => true
	validates :ram, :presence => true, :numericality => true
	validates :disk_size, :presence => true, :numericality => true
	validate :host_ram_capacity_init, :on => :create
	validate :host_disk_capacity_init, :on => :create
	validate :host_ram_capacity, :on => :update
	validate :host_disk_capacity, :on => :update


#	def host_ram_capacity
#		host = Host.find(self.host_id)
#		new_ram_capacity = host.ram_capacity - self.ram
#		if new_ram_capacity < 0
#			errors.add(:ram, "Insufficient ram")
#		end
#	end

#	def host_disk_capacity
#		host = Host.find(self.host_id)
#		new_disk_capacity = host.disk_capacity - self.disk_size
#		if new_disk_capacity < 0
#			errors.add(:disk_size, "Insufficient disk size")
#		end
#	end

	def host_ram_capacity_init
		host = Host.find(self.host_id)
		if host.ram < (host.total_ram + self.ram)
			errors.add(:ram, "too large to be hosted")
		end
	end

	def host_disk_capacity_init
		host = Host.find(self.host_id)
		if host.disk_size < (host.total_disk_size + self.disk_size)
			errors.add(:disk_size, "too large to be hosted")
		end
	end

	def host_ram_capacity
		host = Host.find(self.host_id)
		virtual_server = VirtualServer.find(self.id)
		if (host.ram < (host.total_ram + (self.ram - virtual_server.ram)))
			errors.add(:ram, "too large to be hosted")
		end
	end

	def host_disk_capacity
		host = Host.find(self.host_id)
		virtual_server = VirtualServer.find(self.id)
		if (host.disk_size < (host.total_disk_size + (self.disk_size - virtual_server.disk_size)))
			errors.add(:disk_size, "too large to be hosted")
		end
	end

end
