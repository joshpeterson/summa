class CreateContexts < ActiveRecord::Migration[4.2]
  def change
    create_table :contexts do |t|
      t.integer :part_id
      t.integer :treatise_id
      t.integer :question_id
      t.integer :article_id
      t.integer :number_in_part
      t.integer :number_in_treatise
      t.integer :number_in_question

      t.timestamps null: false
    end
  end
end
