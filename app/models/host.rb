# == Schema Information
# Schema version: 20120310233053
#
# Table name: hosts
#
#  id            :integer         not null, primary key
#  name          :string(255)
#  ram           :integer
#  disk_size     :integer
#  user_id       :integer
#  created_at    :datetime
#  updated_at    :datetime
#  disk_capacity :integer
#  ram_capacity  :integer
#

class Host < ActiveRecord::Base
	has_many :virtual_servers, :dependent => :destroy
	belongs_to :user

	attr_accessible :name, :ram, :disk_size, :total_ram, :total_disk_size
	validates :name, :presence => true, :length => { :maximum => 15 }, :uniqueness => true
	validates :ram, :presence => true, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0 }
	validates :disk_size, :presence => true, :numericality =>  { :only_integer => true, :greater_than_or_equal_to => 0 }
#	validates :disk_capacity, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0 }
#	validates :ram_capacity, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0 }
	validate :maximum_disk_size_reduction, :on => :update
	validate :maximum_ram_reduction, :on => :update



#	def maximum_ram_reduction
#		current_ram = Host.find(self.id).ram
#		current_ram_capacity = Host.find(self.id).ram_capacity
#		if (self.ram < current_ram) && (ram_capacity - (current_ram - self.ram) < 0)
#			errors.add(:ram_capacity, "too little to support given virtual servers")
#		end
#	end

#	def maximum_disk_size_reduction
#		current_disk_size = Host.find(self.id).disk_size
#		current_disk_capacity = Host.find(self.id).disk_capacity
#		if (self.disk_size < current_disk_size) && (disk_capacity - (current_disk_size - self.disk_size) < 0)
#			errors.add(:disk_capacity, "too little to support given virtual servers")
#		end
#	end

	def maximum_ram_reduction
		host = Host.find(self.id)
		if (self.ram < host.total_ram)
			errors.add(:ram,"too little to support current virtual servers")
		end
	end

	def maximum_disk_size_reduction
		host = Host.find(self.id)
		if (self.disk_size < host.total_disk_size)
			errors.add(:disk_size,"too little to support current virtual servers")
		end
	end

end
