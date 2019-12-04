class AddNumberOfArticlesToQuestion < ActiveRecord::Migration[4.2]
  def change
    add_column :questions, :number_of_articles, :integer
  end
end
