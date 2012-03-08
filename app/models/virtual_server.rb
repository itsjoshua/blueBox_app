class VirtualServer < ActiveRecord::Base
	belongs_to :host

	attr_accessible :name, :ram, :disk_size
end
