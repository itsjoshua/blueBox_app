require 'spec_helper'

describe Host do

	before :each do
		@attr = { :name => "H1", :ram => 16, :disk_size => 250}
	end

	it "should create a new instance" do
		Host.create!(@attr)
	end

	it "should create a new vs" do
		@vs = { :name => "VS1", :ram => 8, :disk_size => 100}
		host = Factory(:host)
		new_virtual_server = host.virtual_servers.create!(@vs)
		new_virtual_server.should be_valid
	end

end
