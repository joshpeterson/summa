class CreateTreatises < ActiveRecord::Migration
  def change
    create_table :treatises do |t|
      t.string :title
      t.string :prologue

      t.timestamps null: false
    end
  end
end
