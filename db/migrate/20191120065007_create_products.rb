class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string     :name,            null: false, index: true
      t.references :seller,          null: false, foreign_key: { to_table: :users }
      t.references :buyer,           foreign_key: { to_table: :users }
      t.text       :description,     null: false
      t.references :category,        null: false, foreign_key: true
      t.references :size,            foreign_key: true
      t.references :brand,           foreign_key: true
      t.string     :condition,       null: false
      t.string     :shipping_charge, null: false
      t.string     :shipping_method, null: false
      t.string     :shipping_area,   null: false
      t.string     :shipping_date,   null: false
      t.integer    :price,           null: false
      t.timestamps
    end
  end
end