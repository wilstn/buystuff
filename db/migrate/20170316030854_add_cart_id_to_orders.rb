class AddCartIdToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :cart_id, :integer
  end
end
