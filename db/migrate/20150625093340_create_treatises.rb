class CreateTreatises < ActiveRecord::Migration[4.2]
  def change
    create_table :treatises do |t|
      t.string :title
      t.string :prologue

      t.timestamps null: false
    end
  end
end
