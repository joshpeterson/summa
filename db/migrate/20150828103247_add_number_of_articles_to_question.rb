class AddNumberOfArticlesToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :number_of_articles, :integer
  end
end
