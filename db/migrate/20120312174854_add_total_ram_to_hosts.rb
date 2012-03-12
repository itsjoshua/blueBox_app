class AddTotalRamToHosts < ActiveRecord::Migration
  def self.up
    add_column :hosts, :total_ram, :integer
  end

  def self.down
    remove_column :hosts, :total_ram
  end
end
