class AddReferenceFromItems < ActiveRecord::Migration[5.0]
  def change
    add_reference :items, :user
    add_reference :items, :category
    add_reference :items, :item_state
    add_reference :items, :postage
    add_reference :items, :condition
    add_reference :items, :delivery_day
  end
end
