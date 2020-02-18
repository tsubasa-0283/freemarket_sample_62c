# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :nickname,               null: false,limit: 20
      t.string :email,                  null: false,unique: true 
      t.string :password,               null: false,unique: true 
      t.string :first_name,             null: false,limit: 30
      t.string :last_name,              null: false,limit: 30
      t.string :first_name_kana,        null: false,limit: 30
      t.string :last_name_kana,         null: false,limit: 30
      t.integer :tel,                   null: false,unique: true,limit: 30
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
