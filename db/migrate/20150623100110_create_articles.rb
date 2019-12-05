class CreateArticles < ActiveRecord::Migration[4.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :contrary
      t.string :answer

      t.timestamps null: false
    end
  end
end
