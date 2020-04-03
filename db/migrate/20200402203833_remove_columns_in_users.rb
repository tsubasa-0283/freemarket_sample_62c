class RemoveColumnsInUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :birth_day, :integer
    remove_column :users, :birth_month, :integer
    remove_column :users, :birth_year, :integer
    remove_column :users, :prefecture_id, :string
  end
end
