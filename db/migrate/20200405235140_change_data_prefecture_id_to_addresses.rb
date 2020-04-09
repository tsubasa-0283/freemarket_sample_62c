class ChangeDataPrefectureIdToAddresses < ActiveRecord::Migration[5.0]
  def change
    change_column :addresses, :prefecture_id, :string, default: "0", null: false
  end
end
