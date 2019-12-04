class AddSummaTheologicaIdToPart < ActiveRecord::Migration[4.2]
  def change
    add_column :parts, :summa_theologica_id, :integer
  end
end
