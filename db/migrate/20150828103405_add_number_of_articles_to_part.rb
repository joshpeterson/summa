class AddNumberOfArticlesToPart < ActiveRecord::Migration
  def change
    add_column :parts, :number_of_articles, :integer
  end
end
