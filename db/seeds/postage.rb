postage_array = ['送料込み（出品者負担）','着払い（購入者負担）']
postage_array.each_with_index do |pos|
    Postage.create(delivery_charge: pos)
end