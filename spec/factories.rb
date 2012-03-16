
Factory.define :user do |user|
 user.email "foobar@test.com"
 user.password "foobar"
 user.password_confirmation "foobar"
end

Factory.define :host do |host|
	host.name "h1"
	host.ram 16
	host.disk_size 250
#	host.total_ram 16
#	host.total_disk_size 250
	host.user_id 1
end

Factory.define :virtual_server do |virtual_server|
	virtual_server.name "v1"
	virtual_server.ram 8
	virtual_server.disk_size 100
	virtual_server.host_id 1
end
