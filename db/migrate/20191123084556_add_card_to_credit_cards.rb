class AddCardToCreditCards < ActiveRecord::Migration[5.0]
  def change
    add_column :credit_cards, :customer_id, :string, null: false
    add_column :credit_cards, :card_id,     :string, null: false
  end
end
