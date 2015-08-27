class AddContextToArticle < ActiveRecord::Migration
  def change
    add_reference :articles, :context, index: true, foreign_key: true
  end
end
