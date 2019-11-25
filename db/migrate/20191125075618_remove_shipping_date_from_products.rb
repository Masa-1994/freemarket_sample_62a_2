class RemoveShippingDateFromProducts < ActiveRecord::Migration[5.0]
  def change
    # remove_column :products, :condition, :string
    # remove_column :products, :shipping_charge, :string
    # remove_column :products, :shipping_method, :string
    # remove_column :products, :shipping_area, :string
    remove_column :products, :shipping_date, :string
  end
end
