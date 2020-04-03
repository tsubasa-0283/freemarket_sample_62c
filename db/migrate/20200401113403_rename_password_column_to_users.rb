class RenamePasswordColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    # rename_column :users, :password, :password_dirast
    rename_column :users, :password, :encrypted_password
  end
end
