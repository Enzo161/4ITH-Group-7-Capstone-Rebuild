class AddUnitsToDeepwells < ActiveRecord::Migration[6.0]
  def change
    add_column :deep_wells, :units, :string 
  end
end
