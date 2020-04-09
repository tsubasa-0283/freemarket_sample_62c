class AddBuyerIdToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :buyer_id, :string
  end
end
