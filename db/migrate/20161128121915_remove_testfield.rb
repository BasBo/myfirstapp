class RemoveTestfield < ActiveRecord::Migration
  def self.up
  	remove_column :products, :testfield
  end
end
