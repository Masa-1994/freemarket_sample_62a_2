$(document).on('turbolinks:load', function() {
  var form = $("#charge-form");
  Payjp.setPublicKey('pk_test_2489a8be63710a3ea5c21172');
  $(document).on("click", "#submit-button", function(e) {

    e.preventDefault();
    form.find("input[type=submit]").prop("disabled", true);

    var card = {
        number: $("#payment_card_no").val(),
        cvc: $("#payment_card_cvc").val(),
        exp_month: $("#payment_expiration_date_1i").val(),
        exp_year: $("#payment_expiration_date_2i").val(),
    };
    Payjp.createToken(card, function(s, response) {
      if (response.error) {
        alert('トークン作成エラー発生');
      }
      else {
        $(".number").removeAttr("name");
        $(".cvc").removeAttr("name");
        $(".exp_month").removeAttr("name");
        $(".exp_year").removeAttr("name");
        var token = response.id;

        form.append($('<input type="hidden" name="payjpToken" />').val(token));
        form.get(0).submit();
      }
    });
  });
});




// var form = $("card_form");
//   Payjp.setPublickey("pk_test_2489a8be63710a3ea5c21172");
// //⬆︎まずはテスト鍵をセットする

//   $("#submit_btn").on("click",function(e){
//     e.preventDefault();
// //⬆︎ここでrailsの処理を止めることでjsの処理を行う
//     var card = {
//       number: $("#card_number").val(),
//       cvc: $("#card_cvc").val(),
//       exp_month: $("#card_month").val(),
//       exp_year: $("#card_year").val()
//     };
//   //⬆︎Pay.jpに登録するデータを準備する
  
//   Payjp.createToken(card,function(status,response){
//   //⬆︎先ほどのcard情報がトークンという暗号化したものとして返ってくる
    
//     form.find("input[type=submit]").prop("disabled", true);
//     if(status == 200){ //⬅︎うまくいった場合200になる
//       $("#card_number").removeAttr("name");
//       $("#card_cvc").removeAttr("name");
//       $("#card_month").removeAttr("name");
//       $("#card_year").removeAttr("name");
//       //⬆︎このremoveAttr("name")はデータを保持しないように消している
//       var payjphtml = `<input type="hidden" name="payjpToken" value=${response.id}>`
//       form.append(payjphtml);
//       //⬆︎dbにトークンを保存するのでjsで作ったトークンをセットしてる

//       document.inputForm.submit();
//        //⬆︎そしてここでsubmit！！これでrailsのアクションにいく！もちろん上でトークンをセットしているのでparamsの中には{payjpToken="トークン"}という情報が入っている      
//     }else{
//       alert("カード情報が正しくありません。");
//     }
//   });
// });
