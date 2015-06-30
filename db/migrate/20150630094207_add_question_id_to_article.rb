class AddQuestionIdToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :question_id, :integer
  end
end
