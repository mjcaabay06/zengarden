class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :email_address
      t.string :contact_number
      t.text :address

      t.timestamps
    end
  end
end
