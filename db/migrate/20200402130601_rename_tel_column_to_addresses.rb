class RenameTelColumnToAddresses < ActiveRecord::Migration[5.0]
  def change
    rename_column :addresses, :tel, :address_tel
  end
end
