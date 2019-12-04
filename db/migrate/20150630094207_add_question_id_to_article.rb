class AddQuestionIdToArticle < ActiveRecord::Migration[4.2]
  def change
    add_column :articles, :question_id, :integer
  end
end
