// バックエンドの例外処理の際のポップアップ表示に使うので今はコメントアウト
// (function(factory) {
//     if(type define === "function" && define.amd) {
//         define( ["jquery", "../jquery.validate"], factory);
//     }
//     else if (typeof module === "object" && module.exports) {
//         module.exports = factory(require("jequery"));
//     }
//     else {
//         factory(jQuery);
//     }
// }(function($) {
//     $.extend($.validator.messages, {
//         image: "画像がありません",
//         required: "入力してください",
//         remote: "このフィールドを修正してください",
//         email: "有効なメールアドレスを入力してください",
//         url: "有効なURLを入力してください",
//         date: "有効な日付を入力してください"
//         number: "300以上9999999以下で入力してください",
//         digits: "数字のみを入力してください",
//         creditcard: "有効なクレジットカード番号を入力してください",
//         equalTo: "同じ値をもう一度入力してください",
//         extension: "有効な拡張子を含む値を入力してください",
//         maxlength: $.validator.format( "{0} 文字以内で入力してください"),
//         minlength: $.validator.format( "{0} 円以上で入力してください"),
//         rangelength: $.validator.format("{0} 文字から {1} 文字までの値を入力してください"),
//         range: $.validator.format("{0} から　{1} までの値を入力してください"),
//         step: $.validator.format("{0} の倍数を入力してください"),
//         max: $.validator.format("40文字以下の値を入力してください"),
//         text_max: $.validator.format("1000文字以下の値を入力してください"),
//         min: $.validator.format( "{0} 以上の値を入力してください"),
//         choice: "選択してください",
//         price: $.validator.format("300円以上9999999以下で入力してください")

//     });
//     return $;
// }));