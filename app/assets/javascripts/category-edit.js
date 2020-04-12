$(function(){
  // rootカテゴリ
  var root_id = $("#parent_category").data("root");
  var root = $(`#parent_category > option[value=${root_id}]`);
  root.attr("selected","selected");
  
  // childカテゴリ
  var child_id = $("#child_category").data("child");
  var child = $(`#child_category > option[value=${child_id}]`);
  child.attr("selected","selected");
});

$(function(){
  // カテゴリーセレクトボックスのオプションを作成
  function appendOption(category){
    var html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
    return html;
  }
  // 子カテゴリーの表示作成
  function appendChidrenBox(insertHTML){
    var childSelectHtml = '';
    childSelectHtml = `<div class='form-select-category' id= 'children_wrapper'>
                        <div class='.form-select-category__option'>
                          <select class="form-select__option-box" id="child_category" name="item[category_id]">
                            <option value="---" data-category="---">選択してください</option>
                            ${insertHTML}
                          <select>
                          <i class='fas fa-chevron-down item-main__content-select_icon'></i>
                        </div>
                      </div>`;
    $('.form-select-category__option').append(childSelectHtml);
  }
  // 孫カテゴリーの表示作成
  function appendGrandchidrenBox(insertHTML){
    var grandchildSelectHtml = '';
    grandchildSelectHtml = `<div class='form-select-category' id= 'grandchildren_wrapper'>
                              <div class='.form-select-category__option'>
                                <select class="form-select__option-box" id="grandchild_category" name="item[category_id]">
                                  <option value="---" data-category="---">選択してください</option>
                                  ${insertHTML}
                                <select>
                                <i class='fas fa-chevron-down item-main__content-select_icon'></i>
                              </div>
                            </div>`;
    $('.form-select-category__option').append(grandchildSelectHtml);
  }
  // 親カテゴリー選択後のイベント
  $('#parent_category').on('change', function(){
    var parentCategory = document.getElementById('parent_category').value; //選択された親カテゴリーの名前を取得
    if (parentCategory != ""){ //親カテゴリーが初期値でないことを確認
      $.ajax({
        url: "get_category_children",
        type: 'GET',
        data: { parent_id: parentCategory },
        dataType: 'json',
      })
      .done(function(children){
        $('#children_wrapper').remove(); //親が変更された時、子以下を削除する
        $('#grandchildren_wrapper').remove();
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
      $('#children_wrapper').remove(); //親カテゴリーが初期値になった時、子以下を削除するする
      $('#grandchildren_wrapper').remove();

      $('#brand_wrapper').remove();
    }
  });
  // 子カテゴリー選択後のイベント
  $('.form-select-category__option').on('change', '#child_category', function(){
    var childId = $('#child_category option:selected').data('category'); //選択された子カテゴリーのidを取得
    if (childId != "---"){ //子カテゴリーが初期値でないことを確認
      $.ajax({
        url: 'get_category_grandchildren',
        type: 'GET',
        data: { child_id: childId },
        dataType: 'json',
      })
      .done(function(grandchildren){
        if (grandchildren.length != 0) {
          $('#grandchildren_wrapper').remove(); //子が変更された時、孫以下を削除する
          $('#brand_wrapper').remove();
          var insertHTML = '';
          grandchildren.forEach(function(grandchild){
            insertHTML += appendOption(grandchild);
          });
          appendGrandchidrenBox(insertHTML);
        }
      })
      .fail(function(){
        alert('親カテゴリーから選択してください');
      })
    }else{
      $('#grandchildren_wrapper').remove(); //子カテゴリーが初期値になった時、孫以下を削除する
      $('#brand_wrapper').remove();
    }
  });
});