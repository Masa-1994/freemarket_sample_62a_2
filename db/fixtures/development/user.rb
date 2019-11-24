User.seed do |s|
  s.id                      = 1
  s.nickname                = "アップル"
  s.email                   = "aaa@aaa"
  s.encrypted_password      = "11111111"
  s.family_name             = "苗字"
  s.first_name              = "名前"
  s.family_name_kana        = "ミョウジ"
  s.first_name_kana         = "ナマエ"
  s.birthday_year           = "2000-11-11"
  s.phone_number            = 12345678910
  s.introduce               = "紹介文サンプルサンプルサンプルサンプルサンプル"
end

User.seed do |s|
  s.id                      = 2
  s.nickname                = "テストユーザー"
  s.email                   = "bbb@bbb"
  s.encrypted_password      = "11111111"
  s.family_name             = "販売"
  s.first_name              = "太郎"
  s.family_name_kana        = "ハンバイ"
  s.first_name_kana         = "タロウ"
  s.birthday_year           = "2000-7-7"
  s.phone_number            = 12345678910
  s.introduce               = "紹介文サンプルサンプルサンプルサンプルサンプル"
end
