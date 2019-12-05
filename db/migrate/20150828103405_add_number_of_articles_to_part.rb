class AddNumberOfArticlesToPart < ActiveRecord::Migration[4.2]
  def change
    add_column :parts, :number_of_articles, :integer
  end
end
