class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.integer :amount
      t.boolean :current_order, default: true
      t.boolean :pending_order, default: false
      t.boolean :validate_order, default: false

      t.timestamps
    end
  end
end
