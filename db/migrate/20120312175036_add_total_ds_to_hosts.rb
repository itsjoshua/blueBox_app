class AddTotalDsToHosts < ActiveRecord::Migration
  def self.up
    add_column :hosts, :total_disk_size, :integer
  end

  def self.down
    remove_column :hosts, :total_disk_size
  end
end
