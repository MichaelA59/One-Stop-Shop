class CreateUserauth < ActiveRecord::Migration[5.0]
  def change
    create_table :userauths do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :username, null: false
      t.string :email, null: false
      t.string :phone_number
      t.string :encrypted_password, null: false
      t.string :salt

      t.timestamps
    end
  end
end
