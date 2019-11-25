class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string   :name,        null:false                          #カテゴリ名前
      t.string   :ancestry                                             #親子関係
      t.timestamps
    end
  end
end

