class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.integer :cart_id
      t.integer :order_id
      t.integer :user_id
      t.text :address

      t.timestamps
    end
  end
end
