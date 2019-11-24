// $(document).on('turbolinks:load', function(){
//   // サイズセレクトボックスのオプションを作成
//   function appendSizeOption(size){
//     var html = `<option value="${size.size}">${size.size}</option>`;
//     return html;
//   }
//   // サイズ・ブランド入力欄の表示作成
//   function appendSizeBox(insertHTML){
//     var sizeSelectHtml = '';
//     sizeSelectHtml = `<div class="listing-product-detail__size" id= 'size_wrapper'>
//                                     <label class="listing-default__label" for="サイズ">サイズ</label>
//                                     <span class='listing-default--require'>必須</span>
//                                     <div class='listing-select-wrapper__added--size'>
//                                       <div class='listing-select-wrapper__box'>
//                                         <select class="listing-select-wrapper__box--select" id="size" name="size_id>
//                                           <option value="---">---</option>
//                                           ${insertHTML}
//                                         <select>
//                                         <i class='fa fa-chevron-down.icon-bottom'></i>
//                                       </div>
//                                     </div>
//                                   </div>`;
//     $('.o-proexhibit__explain__fformgroup').append(sizeSelectHtml);
//   }
//   // 孫カテゴリー選択後のイベント
//   $('.o-proexhibit__explain__fformgroup').on('change', '#grandchild_category', function(){
//     var grandchildId = $('#grandchild_category option:selected').data('category'); //選択された孫カテゴリーのidを取得
//     if (grandchildId != "---"){ //孫カテゴリーが初期値でないことを確認
//       $.ajax({
//         url: 'get_size',
//         type: 'GET',
//         data: { grandchild_id: grandchildId },
//         dataType: 'json'
//       })
//       .done(function(sizes){
//         $('#size_wrapper').remove(); //孫が変更された時、サイズ欄以下を削除する
//         $('#brand_wrapper').remove();
//         if (sizes.length != 0) {
//         var insertHTML = '';
//           sizes.forEach(function(size){
//             insertHTML += appendSizeOption(size);
//           });
//           appendSizeBox(insertHTML);
//         }
//       })
//       .fail(function(){
//         alert('サイズ取得に失敗しました');
//       })
//     }else{
//       $('#size_wrapper').remove(); //孫カテゴリーが初期値になった時、サイズ欄以下を削除する
//       $('#brand_wrapper').remove();
//     }
//   });
// });