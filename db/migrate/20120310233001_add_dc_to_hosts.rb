class AddDcToHosts < ActiveRecord::Migration
  def self.up
    add_column :hosts, :disk_capacity, :integer
  end

  def self.down
    remove_column :hosts, :disk_capacity
  end
end
