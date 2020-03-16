# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :nickname,               null: false, default: "" 
      t.string :email,                  null: false, default: ""
      t.string :encrypted_password,     null: false, default: ""
      t.string :first_name             
      t.string :last_name               
      t.string :first_name_kana         
      t.string :last_name_kana          
      t.integer :tel                    
      t.integer :birth_year             
      t.integer :birth_month            
      t.integer :birth_day              
    
      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at
      t.timestamps null: false
      
    end

    add_index :users, :email,                       unique: true
    add_index :users, :encrypted_password,          unique: true
    add_index :users, :tel,                         unique: true


    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end
