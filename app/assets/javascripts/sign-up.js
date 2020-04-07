$(function() {
    // 「次へ」のボタンを押下した時に発動する
    $('.signup__btn').on('click', function(e) {
    // 入力ボタンが空の場合、エラーメッセージを出力する
        if(!input_check()) {
            e.preventDefault();
            return false;
        }
    });
});

function input_check() {
    let result = true;
    // フォームエラーのクラスを削除する
    $('.box-form__input__nickname').remove('inp_error'); //ニックネームのクラス
    $('.box-form__input__email').remove('inp_error'); //メールアドレスのクラス
    $('.box-form__input__pass').remove('inp_error'); //パスワードのクラス
    $('.box-form__input__pass-repeat').remove('inp_error'); //パスワード確認用のクラス
    $('.box-form__input__last-name').remove('inp_error'); //苗字ののクラス
    $('.box-form__input__first-name').remove('inp_error'); //名前のクラス
    $('.box-form__input__last-name-kana').remove('inp_error'); //苗字のカナのクラス
    $('.box-form__input__first-name-kana').remove('inp_error'); //名前のカナのクラス
    $('.box-form__input__birth').remove('inp_error'); //名前のカナのクラス

    // 入力エラー文をリセット
    $("#nickname_error").empty(); //ニックネームのメッセージエラー
    $("#email_error").empty(); //メールアドレスのメッセージエラー
    $("#password_error").empty(); //パスワードのメッセージエラー
    $("#repeat_error").empty(); //パスワード確認用のメッセージエラー
    $(".box-form__input__error__last-name").empty(); //苗字のメッセージエラー
    $(".box-form__input__error__first-name").empty(); //名前のメッセージエラー
    $(".box-form__input__error__last-name-kana").empty(); //苗字カナのメッセージエラー
    $(".box-form__input__error__first-name-kana").empty(); //名前カナのメッセージエラー
    $(".box-form__input__error__birth").empty(); //生年月日のメッセージエラー

    let nickname =$('.box-form__input__nickname').val();
    let email =$('.box-form__input__email').val();
    let password =$('.box-form__input__pass').val();
    let repeat =$('.box-form__input__pass-repeat').val();
    let lastname =$('.box-form__input__last-name').val();
    let firstname =$('.box-form__input__first-name').val();
    let lastnamekana =$('.box-form__input__last-name-kana').val();
    let firstnamekana =$('.box-form__input__first-name-kana').val();
    let birth =$('.box-form__input__birth').val();

    // フォームの中が空の場合のエラーメッセージ

    if(nickname == "") {
        $("#nickname_error").html("ニックネームを入力してください");
        $(".box-form__input__nickname").addClass("inp_error");
        result = false;
    }

    if(email == "") {
        $("#email_error").html("メールアドレスを入力してください");
        $(".box-form__input__email").addClass("inp_error");
        result = false;
    } else if(!email.match(/^([a-zA-Z0-9])+([a-zA-Z0-9\._-])*@([a-zA-Z0-9_-])+([a-zA-Z0-9\._-]+)+$/)){
        $('#email_error').html("フォームマットが不適切です");
        $(".box-form__input__email").addClass("inp_error");
        $(".box-form__input__pass__top").addClass("error_expand");
        $(".box-form__input__ident").addClass("error_expandh");
        result = false;
    }

    if(password == "") {
        $("#password_error").html("パスワードを入力してください");
        $(".box-form__input__pass").addClass("inp_error");
        result = false;
    } else if(!password.length < 7 || password.length > 128){
        $('#password_error').html("7文字以上、128文字以下で入力してください");
        $(".box-form__input__pass").addClass("inp_error");
        result = false;
    } else if(!password.match(/^(?=.*?[a-z])(?=.*?\d)[a-z\d]/i)) {
        $("password_error").html("フォーマットが不適切です");
        $(".box-form__input__pass").addClass("inp_error");
        result = false;
    }

    if(repeat == "") {
        $("#repeat_error").html("パスワードを入力してください");
        $(".box-form__input__pass-repeat").addClass("inp_error");
        result = false;
    } else if(!repeat.length < 7 || repeat.length > 128){
        $('#repeat_error').html("7文字以上、128文字以下で入力してください");
        $(".box-form__input__pass__repeat").addClass("inp_error");
        result = false;
    } else if(password !== repeat) {
        $("repeat_error").html("同じパスワードを入力してください");
        $(".box-form__input__repeat").addClass("inp_error");
        result = false;
    }

    if(lastname == "") {
        $(".box-form__input__error__last-name").html("姓を入力してください");
        $(".box-form__input__last-name").addClass("inp_error");
        result = false;
    } else if(!lastname.match(/^[一-龥ぁ-ん]+$/)){
        $('.box-form__input__error__last-name').html("姓（全角）入力してください");
        $(".box-form__input__last-name").addClass("inp_error");
        result = false;
    }

    if(firstname == "") {
        $(".box-form__input__error__first-name").html("名を入力してください");
        $(".box-form__input__last-name").addClass("inp_error");
        result = false;
    } else if(!firstname.match(/^[一-龥ぁ-ん]+$/)){
        $('.box-form__input__error__first-name').html("名（全角）入力してください");
        $(".box-form__input__first-name").addClass("inp_error");
        result = false;
    }

    if(lasttnamekana == "") {
        $(".box-form__input__error__last-name-kana").html("姓を入力してください");
        $(".box-form__input__last-name-kana").addClass("inp_error");
        result = false;
    } else if(!lastnamekana.match(/^[一-龥ぁ-ん]+$/)){
        $('.box-form__input__error__last-name-kana').html("姓ひらがな（全角）入力");
        $(".box-form__input__last-name-kana").addClass("inp_error");
        result = false;
    }

    if(firstnamekana == "") {
        $(".box-form__input__error__first-name-kana").html("名を入力してください");
        $(".box-form__input__last-name-kana").addClass("inp_error");
        result = false;
    } else if(!firstnamekana.match(/^[ぁ-ん]+$/)){
        $('.box-form__input__error__first-name-kana').html("名ひらがな（全角）入力");
        $(".box-form__input__first-name-kana").addClass("inp_error");
        result = false;
    }

    if(birth == "") {
        $("#birth_error").html("生年月日を入力してください");
        $(".box-form__input__birth").addClass("inp_error");
        result = false;
    }
}

$(function (){
    $('#password').on('change', function(){
        let password = $('#user_password').val();
        let check = $('#password').prop('checked');
        if(check){
            $('.box-form__input__pass__display').html(password);
            $('.box-form__input__pass__display').addClass("pass-display");
        }
        else {
            $('.box-info__input__pass__display').text('');
        }
    });
});