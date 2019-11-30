// 入力された価格に応じて販売手数料と販売利益の計算
$(document).on('turbolinks:load',function() {
  $(".o-priceselect").on("keyup", function() {
    var input = ($(".o-priceselect").val());
    var calculation = input * 0.1;
    var commission = Math.floor(calculation);
    var profits = input - commission;
    var a = commission.toLocaleString('ja-JP', {"style":"currency", "currency":"JPY"});
    var b = profits.toLocaleString('ja-JP', {"style":"currency", "currency":"JPY"});

    if (input >= 300 && input <= 9999999) {
      $('.o-fee__right').text(a);
      $('.o-profit__right').text(b);
    } else {
      $('.o-fee__right').text("-");
      $('.o-profit__right').text("-");
    }

  });
});
