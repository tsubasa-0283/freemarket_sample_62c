# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :nickname,               null: false
      t.string :email,                  null: false
      t.string :password,               null: false
      t.string :first_name,             null: false
      t.string :last_name,              null: false
      t.string :first_name_kana,        null: false
      t.string :last_name_kana,         null: false
      t.integer :tel,                   null: false
      t.integer :birth_year            
      t.integer :birth_month           
      t.integer :birth_day             
      
    end

    add_index :users, :email,             unique: true
    add_index :users, :password,          unique: true
    add_index :users, :tel,               unique: true


    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end
