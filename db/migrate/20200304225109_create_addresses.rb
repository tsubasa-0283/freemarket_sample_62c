class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.integer :prefecture_id, null: false
      t.string  :city, null: false
      t.references :user, foreign_key: true
      t.integer :post_number, null: false
      t.string  :address, null: false
      t.string  :building, null: false
      t.integer :tel, null:false
      t.timestamps
    end
  end
end
