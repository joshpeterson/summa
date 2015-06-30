class AddSummaTheologicaIdToPart < ActiveRecord::Migration
  def change
    add_column :parts, :summa_theologica_id, :integer
  end
end
