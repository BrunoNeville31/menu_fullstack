class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.references :category, null: false, foreign_key: true
      t.integer :sub_category
      t.decimal :price
      t.text :description
      t.string :name
      t.integer :rating
      t.decimal :promotional_price
      t.boolean :is_promotional

      t.timestamps
    end
  end
end
