class CreateCreditCards < ActiveRecord::Migration[5.0]
  def change
    create_table :credit_cards do |t|
      t.references :user,           null: false, foreign_key: true                 #userID
      t.string :customer_id,      null: false                                               #顧客ID
      t.string :card_id,              null: false                                                #カードID
      t.timestamps
    end
  end
end
