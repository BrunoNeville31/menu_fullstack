class CreateCompanyWorkings < ActiveRecord::Migration[7.1]
  def change
    create_table :company_workings do |t|
      t.integer :day
      t.string :opened
      t.string :closed
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
