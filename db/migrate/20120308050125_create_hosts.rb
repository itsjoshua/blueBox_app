class CreateHosts < ActiveRecord::Migration
  def self.up
    create_table :hosts do |t|
      t.string :name
      t.integer :ram
      t.integer :disk_size
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :hosts
  end
end
