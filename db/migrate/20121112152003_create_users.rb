class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fname
      t.string :lname
      t.string :email
      t.string :street_address
      t.string :address2
      t.string :city
      t.string :state_province
      t.string :postal_code
      t.string :likes
      t.boolean :admin
      t.string :hashed_password 
      t.string :salt

      t.timestamps
    end
  end
end
