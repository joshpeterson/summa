class DropObjectionsTable < ActiveRecord::Migration
  def up
    drop_table :objections
  end

  def down
    fail ActiveRecord::IrreversibleMigration
  end
end
