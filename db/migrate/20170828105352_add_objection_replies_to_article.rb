class AddObjectionRepliesToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :objection_replies, :text, array:true, default: []
  end
end
