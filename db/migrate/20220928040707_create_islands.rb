class CreateIslands < ActiveRecord::Migration[6.0]
  def change
    create_table :islands do |t|
      t.text :island_name

      t.timestamps
    end
  end
end
