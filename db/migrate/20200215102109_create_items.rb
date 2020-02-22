class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name                  null: false
      t.text :description             null: false
      t.integer :condition_id         null: false
      t.references :user_id           null: false, foreign_key: true
      t.integer :postage_id           null: false, foreign_key: true
      t.string :prefecture            null: false
      t.integer :delivery_day_id      null: false
      t.integer :price                null: false
      t.integer :brand_id             null: false
      t.integer :likes_count          null: false
      t.references :category_id       null: false , foreign_key: true
      t.references :item_state_id     null: false , foreign_key: true
      t.timestamps
    end
  end
end
