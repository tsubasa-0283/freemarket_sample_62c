class ChangeDataTelToUsers < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :tel, :string
  end
end
