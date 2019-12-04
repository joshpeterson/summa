class AddContextToArticle < ActiveRecord::Migration[4.2]
  def change
    add_reference :articles, :context, index: true, foreign_key: true
  end
end
