class CreateCategorySizes < ActiveRecord::Migration[5.0]
  def change
    create_table :category_sizes do |t|
      t.references  :category,  null: false,  foreign_key: true    #カテゴリーID
      t.references  :size,      null: false,  foreign_key: true    #サイズID
      t.timestamps
    end
  end
end
