class AddObjectionStatementsToArticle < ActiveRecord::Migration[4.2]
  def change
    add_column :articles, :objection_statements, :text, array:true, default: []
  end
end
