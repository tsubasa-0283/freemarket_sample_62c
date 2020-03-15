delivery_day_array = ['未定','らくらくメルカリ便','ゆうメール','レターパック','普通郵便（定形、定形外）','クロネコヤマト','ゆうパック','クリックポスト','ゆうパケット']
delivery_day_array.each_with_index do |deli|
    DeliveryDay.create(day: deli)
end