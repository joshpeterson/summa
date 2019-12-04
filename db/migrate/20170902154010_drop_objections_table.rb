class DropObjectionsTable < ActiveRecord::Migration[4.2]
  def up
    drop_table :objections
  end

  def down
    fail ActiveRecord::IrreversibleMigration
  end
end
