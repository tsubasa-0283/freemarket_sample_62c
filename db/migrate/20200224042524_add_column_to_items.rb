class AddColumnToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :prefecture_id, :string, null: false
    add_column :items, :brand_id, :string, null: false
    add_column :items, :description, :text, null: false
    add_column :items, :likes_count, :integer, null: false
  end
end
