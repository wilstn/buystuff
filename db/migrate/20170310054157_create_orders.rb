class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :product_id
      t.integer :quantity
      t.decimal :total_amount
      t.text :shipping_address
      t.string :email
      t.integer :user_id

      t.timestamps
    end
  end
end
