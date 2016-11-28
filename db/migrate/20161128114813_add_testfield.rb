class AddTestfield < ActiveRecord::Migration
  def change
  	add_column :products, :testfield, :string
  end
end
