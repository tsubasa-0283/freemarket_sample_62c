class RemoveConditionIdFromItems < ActiveRecord::Migration[5.0]
  def change
    remove_column :items, :postage_id, :integer
    remove_column :items, :delivery_day_id, :integer
    remove_column :items, :brand_id, :integer
  end
end
