class RemovePhoneNumberFromAddresses < ActiveRecord::Migration[5.0]
  def change
    remove_column :addresses, :phone_number, :integer
  end
end
