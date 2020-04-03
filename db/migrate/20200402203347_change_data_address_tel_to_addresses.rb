class ChangeDataAddressTelToAddresses < ActiveRecord::Migration[5.0]
  def change
    change_column :addresses, :address_tel, :string
  end
end
