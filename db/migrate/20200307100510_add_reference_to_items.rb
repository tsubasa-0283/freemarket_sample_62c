class AddReferenceToItems < ActiveRecord::Migration[5.0]
  def change
    add_reference :items, :postage, foreign_key: true
    add_reference :items, :delivery_day, foreign_key: true
    add_reference :items, :condition, foreign_key: true
  end
end
