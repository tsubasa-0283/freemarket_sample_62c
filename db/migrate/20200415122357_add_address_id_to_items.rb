class AddAddressIdToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :address_id, :integer, foreign_key: true
  end
end
