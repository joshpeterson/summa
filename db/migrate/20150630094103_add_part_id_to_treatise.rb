class AddPartIdToTreatise < ActiveRecord::Migration
  def change
    add_column :treatises, :part_id, :integer
  end
end
