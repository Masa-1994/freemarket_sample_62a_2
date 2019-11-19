class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.references :user,            null: false, foreign_key: true     #user_id情報
      t.integer    :postal_code,     null: false                        #郵便番号
      t.integer    :prefecture_id,   null: false                        #prefecture_id情報
      t.string     :city,            null: false                        #都道府県
      t.string     :municipalities,  null: false                        #市区町村
      t.string     :house_number,    null: false                        #番地
      t.string     :building_name                                       #建物名
      t.integer    :phone_number,    limit: 4                           #電話番号
      t.timestamps
    end
  end
end
