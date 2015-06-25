class CreateObjections < ActiveRecord::Migration
  def change
    create_table :objections do |t|
      t.string :statement
      t.string :reply

      t.timestamps null: false
    end
  end
end
