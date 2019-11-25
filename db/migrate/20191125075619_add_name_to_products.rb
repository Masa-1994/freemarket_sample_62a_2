class AddNameToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :condition, :integer
    add_column :products, :shipping_charge, :integer
    add_column :products, :shipping_method, :integer
    add_column :products, :shipping_area, :integer
    add_column :products, :shipping_date, :integer
  end
end
