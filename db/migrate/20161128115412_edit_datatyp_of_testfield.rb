class EditDatatypOfTestfield < ActiveRecord::Migration
  def change
  	change_column :products, :testfield, 'integer USING CAST(testfield AS integer)'
  end
end
