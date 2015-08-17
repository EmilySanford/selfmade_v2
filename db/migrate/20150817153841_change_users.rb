class ChangeUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    remove_column :users, :first_name
    remove_column :users, :last_name
    remove_column :users, :email
    remove_column :users, :age
    remove_column :users, :location
    remove_column :users, :used_editing_apps
  end
end
