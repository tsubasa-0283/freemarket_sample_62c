class CreatePostages < ActiveRecord::Migration[5.0]
  def change
    create_table :postages do |t|
      t.string :delivery_charge, null: false
      t.timestamps
    end
  end
end
