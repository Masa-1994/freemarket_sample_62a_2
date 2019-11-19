# ルート
crumb :root do
  link "メルカリ", root_path
end

# マイページ
crumb :user do
  link "マイページ", user_path
  parent :root
end

# プロフィール
crumb :profile do
  link "プロフィール", profile_user_path
  parent :user
end

# 支払い方法
crumb :payment do
  link "支払い方法", payment_user_path
  parent :user
end

# 本人情報の登録
crumb :identification do
  link "本人情報の登録",identification_user_path
  parent :user
end

# ログアウト
crumb :logout do
  link "ログアウト",logout_user_path
  parent :user
end