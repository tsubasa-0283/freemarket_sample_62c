class AddSizeIdToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :size_id, :string
  end
end
