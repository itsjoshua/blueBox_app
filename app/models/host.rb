class Host < ActiveRecord::Base
	has_many :virtual_servers
	belongs_to :user

	attr_accessible :name, :ram, :disk_size
	validates :name, :presence => true
end
