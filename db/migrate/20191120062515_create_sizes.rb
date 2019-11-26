class CreateSizes < ActiveRecord::Migration[5.0]
  def change
    create_table :sizes do |t|
      t.string   :name,  null: false    #サイズ名前
      t.string   :ancestry              #親子関係
      t.timestamps
    end
  end
end