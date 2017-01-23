class EditDatatypOfTestfield < ActiveRecord::Migration
  def change
  	change_column :products, :testfield, 'integer USING CAST(column_name AS integer)'
  end
end
