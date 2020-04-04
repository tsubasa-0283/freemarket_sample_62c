class RemoveItemStateIdToItems < ActiveRecord::Migration[5.0]
  def change
    remove_column :items, :item_state_id, :string
  end
end
