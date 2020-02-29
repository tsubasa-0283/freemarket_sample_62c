require 'payjp'

  def pay
    Payjp.api_key = "秘密鍵（sk_~）"
    Payjp::Charge.create(
      amount: 1100, # 決済する値段
      card: params['payjp-token'], # フォームを送信すると生成されるトークン
      currency: 'jpy'
    )
  end