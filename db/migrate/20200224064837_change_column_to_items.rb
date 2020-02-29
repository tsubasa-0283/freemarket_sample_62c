class ChangeColumnToItems < ActiveRecord::Migration[5.0]
  def up
    change_column :items, :user_id, :integer, null: false
    change_column :items, :category_id, :integer, null: false
    change_column :items, :item_state_id, :integer, null: false
    change_column :items, :postage_id, :integer, null: false
  end
end
