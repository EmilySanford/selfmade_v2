class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :email
      t.string :instagram_handler
      t.string :snapchat_handler
      t.integer :age
      t.string :location
      t.text :used_editing_apps

    end
  end
end
