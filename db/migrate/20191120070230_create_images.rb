class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.references  :product,  null: false,  foreign_key: true    #商品ID
      t.string      :image,    null: false                        #写真
      t.timestamps
    end
  end
end
