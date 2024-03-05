class CreateSubCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :sub_categories do |t|
      t.string :name
      t.references :category, null: false, foreign_key: true
      t.boolean :active
      t.text :description

      t.timestamps
    end
  end
end
