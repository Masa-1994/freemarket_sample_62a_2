class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table  :products do |t|
      t.string         :name,                          null: false, index: true                                              #商品名
      t.references :seller,                         null: false, foreign_key: { to_table: :users }            #買う人（user_id）
      t.references :buyer,                         foreign_key: { to_table: :users }                             #売る人（user_id)
      t.text             :description,               null: false                                                                 #商品名
      t.references :category,                   null: false, foreign_key: true                                   #カテゴリ
      t.references :size,                           foreign_key: true                                                     #サイズID
      t.references :brand,                        foreign_key: true                                                     #ブランドID
      t.integer       :condition,                  null: false                                                                 #商品状態
      t.integer       :shipping_charge,      null: false                                                                 #送料負担
      t.integer       :shipping_method,     null: false                                                                #送料方法
      t.integer       :shipping_area,           null: false                                                               #都道府県
      t.integer       :shipping_date,          null: false                                                                #配達日数
      t.integer       :price,                         null: false                                                                #値段
      t.timestamps
    end
  end
end