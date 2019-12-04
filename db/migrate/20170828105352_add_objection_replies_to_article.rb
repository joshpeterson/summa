class AddObjectionRepliesToArticle < ActiveRecord::Migration[4.2]
  def change
    add_column :articles, :objection_replies, :text, array:true, default: []
  end
end
