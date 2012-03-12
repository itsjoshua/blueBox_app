class AddRcToHosts < ActiveRecord::Migration
  def self.up
    add_column :hosts, :ram_capacity, :integer
  end

  def self.down
    remove_column :hosts, :ram_capacity
  end
end
