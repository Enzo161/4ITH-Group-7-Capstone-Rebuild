class CreateDeepWells < ActiveRecord::Migration[6.0]
  def change
    create_table :deep_wells do |t|
      t.text :deep_well_name
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
