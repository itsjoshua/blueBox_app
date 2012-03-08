class CreateVirtualServers < ActiveRecord::Migration
  def self.up
    create_table :virtual_servers do |t|
      t.string :name
      t.integer :ram
      t.integer :disk_size
      t.integer :host_id

      t.timestamps
    end
  end

  def self.down
    drop_table :virtual_servers
  end
end
