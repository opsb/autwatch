class AddPortsToInstance < ActiveRecord::Migration
  def self.up
    add_column :instances, :query_port, :integer
    add_column :instances, :index_port, :integer
  end

  def self.down
    remove_column :instances, :column_name
    remove_column :instances, :query_port
  end
end
