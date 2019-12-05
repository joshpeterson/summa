class CreateSummaTheologicas < ActiveRecord::Migration[4.2]
  def change
    create_table :summa_theologicas do |t|

      t.timestamps null: false
    end
  end
end
