class CreateAuditLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :audit_logs do |t|
      t.text :event, null: false
      t.text :modifier, null: false
      t.text :table_name, null: false
      t.text :object_name, null: false
      t.datetime :created_at, null: false
      t.date :date_created, null: false
    end
  end
end
