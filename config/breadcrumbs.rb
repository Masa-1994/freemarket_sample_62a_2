crumb :root do
  link "メルカリ", root_path
end

crumb :mypage do
  link "マイページ", user_path
  parent :root
end

crumb :profile do
  link "プロフィール", profile_user_path
  parent :mypage
end

crumb :payment do
  link "支払い方法", payment_user_path
  parent :mypage
end

crumb :credit do
  link "クレジットカード情報入力", credit_user_path
  parent :mypage
end

crumb :identification do
  link "本人情報の登録", identification_user_path
  parent :mypage
end

crumb :logout do
  link "ログアウト", logout_user_path
  parent :mypage
end