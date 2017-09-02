class AddObjectionStatementsToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :objection_statements, :text, array:true, default: []
  end
end
