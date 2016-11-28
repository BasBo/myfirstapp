class EditDatatypOfTestfield < ActiveRecord::Migration
  def change
  	change_column :products, :testfield, :integer
  end
end
