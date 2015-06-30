class AddTreatiseIdToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :treatise_id, :integer
  end
end
