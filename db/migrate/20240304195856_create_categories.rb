class CreateCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.boolean :sub_category
      t.text :description
      t.boolean :active

      t.timestamps
    end
  end
end
