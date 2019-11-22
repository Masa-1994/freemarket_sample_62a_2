class RemoveCityFromAddresses < ActiveRecord::Migration[5.0]
  def change
    remove_column :addresses, :city, :string
  end
end
