class AddNumberOfArticlesToTreatise < ActiveRecord::Migration[4.2]
  def change
    add_column :treatises, :number_of_articles, :integer
  end
end
