Product.seed do |s|
  s.id = 1
  s.name = "ロングコート"
  s.seller_id = 1
  # s.buyer_id = 1
  s.description = "未使用です"
  s.category_id = 1
  # s.size_id = 1
  # s.brand_id = 1
  s.condition = "新品、未使用"
  s.shipping_charge = "送料込み(出品者負担)"
  s.shipping_method = "らくらくメルカリ便"
  s.shipping_area = "北海道"
  s.shipping_date = "1~2日で発送"
  s.price = "1000"
end

Product.seed do |s|
  s.id = 2
  s.name = "Tシャツ"
  s.seller_id = 1
  # s.buyer_id = 2
  s.description = "半袖です"
  s.category_id = 3
  # s.size_id = 2
  # s.brand_id = 2
  s.condition = "未使用に近い"
  s.shipping_charge = "着払い(購入者負担)"
  s.shipping_method = "ゆうメール"
  s.shipping_area = "青森県"
  s.shipping_date = "2~3日で発送"
  s.price = "500"
end