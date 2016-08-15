class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :stock
      t.integer :price
      t.integer :weight
      t.string :category
      t.string :variety
      t.date :start_season
      t.date :end_season
      t.references :user, foreign_key: true
      t.boolean :published, default: true

      t.timestamps
    end
  end
end
