class RemoveCardFromCreditCards < ActiveRecord::Migration[5.0]
  def change
    remove_column :credit_cards, :card_number, :integer
    remove_column :credit_cards, :deadline_month, :integer
    remove_column :credit_cards, :deadline_year, :integer
    remove_column :credit_cards, :security_code, :integer
  end
end
