class RemoveLikesCountToItems < ActiveRecord::Migration[5.0]
  def change
    remove_column :items, :likes_count, :string
    
  end
end
