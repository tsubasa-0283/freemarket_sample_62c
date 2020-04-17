class AddShippingdayIdToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :shippingday_id, :integer, foreign_key: true
  end
end
