class CreateContexts < ActiveRecord::Migration
  def change
    create_table :contexts do |t|
      t.integer :part_id
      t.integer :treatise_id
      t.integer :question_id
      t.integer :article_id

      t.timestamps null: false
    end
  end
end
