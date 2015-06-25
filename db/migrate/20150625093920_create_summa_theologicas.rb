class CreateSummaTheologicas < ActiveRecord::Migration
  def change
    create_table :summa_theologicas do |t|

      t.timestamps null: false
    end
  end
end
