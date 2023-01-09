class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.text :client_name
      t.references :region, null: false, foreign_key: true

      t.timestamps
    end
  end
end
