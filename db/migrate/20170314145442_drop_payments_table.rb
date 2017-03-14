class DropPaymentsTable < ActiveRecord::Migration[5.0]
  def up
  drop_table :payments
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
