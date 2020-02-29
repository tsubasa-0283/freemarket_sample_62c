class AddColumnToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :prefecture, :string, null: false
    add_column :items, :description, :text, null: false
    add_column :items, :condition_id, :integer, null: false
    add_column :items, :delivery_day_id, :integer, null: false
    add_column :items, :brand_id, :integer, null: false
    add_column :items, :likes_count, :integer, null: false
  end
end
