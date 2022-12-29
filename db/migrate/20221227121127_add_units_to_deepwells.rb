class AddUnitsToDeepwells < ActiveRecord::Migration[6.0]
  def change
    add_column :deep_wells, :depthTotalUnits, :string 
    add_column :deep_wells, :waterLimitUnits, :string 
  end
end
