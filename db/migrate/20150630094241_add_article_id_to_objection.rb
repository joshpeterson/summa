class AddArticleIdToObjection < ActiveRecord::Migration[4.2]
  def change
    add_column :objections, :article_id, :integer
  end
end
