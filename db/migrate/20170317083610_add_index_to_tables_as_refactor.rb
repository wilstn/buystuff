class AddIndexToTablesAsRefactor < ActiveRecord::Migration[5.0]
  def change
    add_index :carts, :user_id
    add_index :orders, :product_id
    add_index :orders, :user_id
    add_index :orders, :cart_id
    add_index :payments, :cart_id
    add_index :payments, :order_id
    add_index :payments, :user_id
  end
end
