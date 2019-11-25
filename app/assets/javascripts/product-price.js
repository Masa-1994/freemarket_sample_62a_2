// 入力された価格に応じて販売手数料と販売利益の計算
$(document).on('turbolinks:load',function() {
  $(".o-priceselect").on("keyup", function() {
    var input = ($(".o-priceselect").val());
    var calculation = input * 0.1;
    var commission = Math.ceil(calculation);
    var profits = input - commission;

    $('.o-fee__right').text("￥" + commission);
    $('.o-profit__right').text("￥" + profits);
  });
});
