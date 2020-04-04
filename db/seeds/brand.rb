brand_array = ['シャネル','グッチ','ルイヴィトン','シュプリーム','アディダス','ナイキ','プーマ','グラッドハンド','BOSE','Apple']
brand_array.each_with_index do |bra|
    Brand.create(name: bra)
end