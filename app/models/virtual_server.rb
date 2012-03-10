class VirtualServer < ActiveRecord::Base
	belongs_to :host

	attr_accessible :name, :ram, :disk_size
	validates :name, :presence => true, :length => { :maximum => 15 }, :uniqueness => true
	validates :ram, :presence => true, :numericality => true
	validates :disk_size, :presence => true, :numericality => true
end
