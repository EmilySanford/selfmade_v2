class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.references :user
      t.references :admin
      t.references :original_picture, index: true
    end
  end
end
