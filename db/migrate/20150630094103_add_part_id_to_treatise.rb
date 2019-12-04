class AddPartIdToTreatise < ActiveRecord::Migration[4.2]
  def change
    add_column :treatises, :part_id, :integer
  end
end
