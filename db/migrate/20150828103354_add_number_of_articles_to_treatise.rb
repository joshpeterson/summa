class AddNumberOfArticlesToTreatise < ActiveRecord::Migration
  def change
    add_column :treatises, :number_of_articles, :integer
  end
end
