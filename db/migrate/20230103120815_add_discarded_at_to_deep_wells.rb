class AddDiscardedAtToDeepWells < ActiveRecord::Migration[6.0]
  def change
    add_column :deep_wells, :discarded_at, :datetime
    add_index :deep_wells, :discarded_at
  end
end
