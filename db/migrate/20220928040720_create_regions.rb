class CreateRegions < ActiveRecord::Migration[6.0]
  def change
    create_table :regions do |t|
      t.text :region_name
      t.references :island, null: false, foreign_key: true

      t.timestamps
    end
  end
end
