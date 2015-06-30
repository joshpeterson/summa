class AddArticleIdToObjection < ActiveRecord::Migration
  def change
    add_column :objections, :article_id, :integer
  end
end
