$(document).on('turbolinks:load', function(){
  function appendOption(category){
    var html =`<option value="${category.name}" data-category="${category.id}">${category.name}</option>`;
    return html;
  }
   // 子カテゴリーの表示作成
  function appendChidrenBox(insertHTML){
    var childSelectHtml = '';
    childSelectHtml = `<div class='o-proexhibit__explain__from__added' id= 'children_wrapper'>
                                        <select class="o-proexhibit__explain__from--select" id="child_category" name="category_id">
                                          <option value="---" data-category="---">---</option>
                                          ${insertHTML}
                                        <select>
                                        <i class='fa fa-chevron-down.icon-bottom'></i>
                                    </div>`
    $('.o-proexhibit__explain__formbox').append(childSelectHtml);
  }
  // 孫カテゴリーの表示作成
  function appendGrandchidrenBox(insertHTML){
    var grandchildSelectHtml = '';
    grandchildSelectHtml = `<div class='o-proexhibit__explain__from__added' id= 'grandchildren_wrapper'>
                                                  <select class="o-proexhibit__explain__from--select" id="grandchild_category" name="category_id">
                                                    <option value="---" data-category="---">---</option>
                                                    ${insertHTML}
                                                  <select>
                                                  <i class='fa fa-chevron-down.icon-bottom'></i>
                                              </div>`
    $('.o-proexhibit__explain__formbox').append(grandchildSelectHtml);
  }
  // 親カテゴリー選択後のイベント
  $('#parent_category').on('change', function(){
    var parentCategory = document.getElementById('parent_category').value; 
    if (parentCategory != ''){ 
      $.ajax({
        url: 'category_children',
        type: 'GET',
        data: { parent_name: parentCategory },
        dataType: 'json'
      })
      .done(function(children){
        $('#children_wrapper').remove(); //親が変更された時、子以下を削除する
        $('#grandchildren_wrapper').remove();
        $('#size_wrapper').remove();
        $('#brand_wrapper').remove();
        var insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendOption(child);
        });
        appendChidrenBox(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#children_wrapper').remove(); //親カテゴリーが初期値になった時、子以下を削除する
      $('#grandchildren_wrapper').remove();
      $('#size_wrapper').remove();
      $('#brand_wrapper').remove();
    }
  });
  // 子カテゴリー選択後のイベント
  $('.o-proexhibit__explain__formbox').on('change', '#child_category', function(){
    var childId = $('#child_category option:selected').data('category'); //選択された子カテゴリーのidを取得
    if (childId != "---"){ //子カテゴリーが初期値でないことを確認
      $.ajax({
        url: 'category_grandchildren',
        type: 'GET',
        data: { child_id: childId },
        dataType: 'json'
      })
      .done(function(grandchildren){
        if (grandchildren.length != 0) {
          $('#grandchildren_wrapper').remove(); //子が変更された時、孫以下を削除するする
          $('#size_wrapper').remove();
          $('#brand_wrapper').remove();
          var insertHTML = '';
          grandchildren.forEach(function(grandchild){
            insertHTML += appendOption(grandchild);
          });
          appendGrandchidrenBox(insertHTML);
        }
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#grandchildren_wrapper').remove(); //子カテゴリーが初期値になった時、孫以下を削除する
      $('#size_wrapper').remove();
      $('#brand_wrapper').remove();
    }
  });
});