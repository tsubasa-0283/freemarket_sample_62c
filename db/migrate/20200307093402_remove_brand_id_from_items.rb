class RemoveBrandIdFromItems < ActiveRecord::Migration[5.0]
  def change
    remove_column :items, :brand_id, :integer
  end
end