class Product < ApplicationRecord

  # validation
  validates :name,                 presence: true, length: { in: 1..40}, presence: true
  validates :description,          presence: true, length: { in: 1..1000}
  validates :condition,            presence: true
  validates :shipping_charge,      presence: true
  validates :shipping_area,        presence: true
  validates :shipping_date,        presence: true
  validates :shipping_method,      presence: true
  validates :category_id,          presence: true
  validates :seller_id,            presence: true
  validates :price,                presence: true, numericality: { only_integer: true, greater_than: 300, less_than: 9999999}

  # associate
  belongs_to                    :user
  belongs_to                    :category
  belongs_to                    :size,        optional: true
  belongs_to                    :brand,       optional: true
  has_many                      :images,      dependent: :destroy
  accepts_nested_attributes_for :images,      allow_destroy: true
  belongs_to :seller, class_name: "User"
  belongs_to :buyer, class_name: "User"


  enum condition:[:"---",:"新品、未使用",:"未使用に近い",:"目立った傷や汚れなし",:"やや傷や汚れあり",:"傷や汚れあり",:"全体的に状態が悪い"], _prefix: true

  enum shipping_charge: [:"---",:"送料込み(出品者負担)",:"着払い(購入者負担)"] , _prefix: true
  enum shipping_area: [:"---",:"北海道",:"青森県",:"岩手県",:"宮城県",:"秋田県",:"山形県",:"福島県",
  :"茨城県",:"栃木県",:"群馬県",:"埼玉県",:"千葉県",:"東京都",:"神奈川県",
  :"新潟県",:"富山県",:"石川県",:"福井県",:"山梨県",:"長野県",:"岐阜県",:"静岡県",:"愛知県",:"三重県",:"滋賀県",:"京都府",:"大阪府",:"兵庫県",:"奈良県",:"和歌山県", :"鳥取県",:"島根県",:"岡山県",:"広島県",:"山口県",:"徳島県",:"香川県",:"愛媛県",:"高知県",:"福岡県",:"佐賀県",:"長崎県",:"熊本県",:"大分県",:"宮崎県",:"鹿児島県",:"沖縄県"  ] , _prefix: true
  enum shipping_date:[:"---",:"1~2日で発送", :"2~3日で発送",:"4~7日で発送"], _prefix: true

  enum shipping_method:[:"---",:"未定",:"らくらくメルカリ便",:"ゆうメール",:"レターパック",:"普通郵便(定形、定形外)",:"クロネコヤマト",:"ゆうパック",:"クリックポスト",:"ゆうパケット"], _prefix: true

  # def previous
  #   Product.where("id < ?", self.id).order("id DESC").first
  # end

  # def next
  #   Product.where("id > ?", self.id).order("id ASC").first
  # end

end
