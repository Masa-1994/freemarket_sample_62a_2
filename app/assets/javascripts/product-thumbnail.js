$(document).on('turbolinks:load',function() {
  $('img.k-product-details__contents__content__left__pictures__imgs').mouseover(function(){
 // "_thumb"を削った画像ファイル名を取得
  var selectedSrc = $(this).attr('src').replace(/^(.+)_thumb(\.gif|\.jpg|\.png+)$/, "$1"+"$2");
  
 // 画像入れ替え
  $('img.k-product-details__contents__content__left__picture__img').stop().fadeOut(50,
  function(){
  $('img.k-product-details__contents__content__left__picture__img').attr('src', selectedSrc);
  $('img.k-product-details__contents__content__left__picture__img').stop().fadeIn(200);
  }
  );
 // サムネイルの枠を変更
  $(this).css({"opacity":"1"});
  });
  
 // マウスアウトでサムネイル枠もとに戻す
  $('img.k-product-details__contents__content__left__pictures__imgs').mouseout(function(){
  $(this).css({"opacity":"0.5"});
  });
});



// sold
 // マウスアウトでサムネイル枠もとに戻す
$(document).on('turbolinks:load',function() {
  $('img.k-product-details__contents__content__left-sold__pictures__imgs').mouseover(function(){
 // "_thumb"を削った画像ファイル名を取得
  var selectedSrc = $(this).attr('src').replace(/^(.+)_thumb(\.gif|\.jpg|\.png+)$/, "$1"+"$2");
  
 // 画像入れ替え
  $('img.k-product-details__contents__content__left-sold__picture__img').stop().fadeOut(50,
  function(){
  $('img.k-product-details__contents__content__left-sold__picture__img').attr('src', selectedSrc);
  $('img.k-product-details__contents__content__left-sold__picture__img').stop().fadeIn(200);
  }
  );
 // サムネイルの枠を変更
  $(this).css({"opacity":"1"});
  });
  
 // マウスアウトでサムネイル枠もとに戻す
  $('img.k-product-details__contents__content__left-sold__pictures__imgs').mouseout(function(){
  $(this).css({"opacity":"0.5"});
  });
});