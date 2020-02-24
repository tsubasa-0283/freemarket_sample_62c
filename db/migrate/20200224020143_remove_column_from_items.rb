class RemoveColumnFromItems < ActiveRecord::Migration[5.0]
  def change
    remove_column  :items, :prefecture, :string
    remove_column  :items, :description, :text
    remove_column  :items, :condition_id, :integer
    remove_column  :items, :delivery_day_id, :integer
    remove_column  :items, :brand_id, :integer
    remove_column  :items, :likes_count, :integer
  end
end
