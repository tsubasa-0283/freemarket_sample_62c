$(function(){
    // 出品するボタンを登録した時に発動
    $(".btn-box__red").on('click', function(e){
        if(!item_check()){
            e.preventDefault();
            return false;
        }
    });
    // 商品のエラーメッセージ
    $("item-main__form").validate({
        rules: {
            "item[images][]": {required: true, minnlength: 1, maxlength: 10},
            "item[name]": {required: true, maxlength: 40},
            "item[description]": {required: true, maxlength: 1000 },
            "item[category_id]": { required: true },
            "item[condition_id]": {required: true },
            "item[delivery_day_id]": {required: true},
            "item[postage_id]": {required: true}
        },
        message: {
            "item[images][]": {required: "画像がありません"},
            "item[name]": {required: "入力してください"},
            "item[description]": { maxlength: "1000文字以下で入力してください" },
            "item[category_id]": { required: true, choice: "選択して下さい" },
            "item[condition_id]": {required: "選択して下さい" },
            "item[delivery_day_id]": {required: 選択して下さい},
            "item[postage_id]": {required: "選択して下さい"},
            "item[price]": { required: "300から999999までの値を入力して下さい。"}
        }
    });
});

