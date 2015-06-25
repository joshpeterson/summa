class CreateParts < ActiveRecord::Migration
  def change
    create_table :parts do |t|
      t.string :title
      t.string :prologue

      t.timestamps null: false
    end
  end
end
