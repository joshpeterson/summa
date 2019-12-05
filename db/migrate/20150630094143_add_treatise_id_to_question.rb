class AddTreatiseIdToQuestion < ActiveRecord::Migration[4.2]
  def change
    add_column :questions, :treatise_id, :integer
  end
end
