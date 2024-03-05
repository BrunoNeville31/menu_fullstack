class CreateCompanyPhones < ActiveRecord::Migration[7.1]
  def change
    create_table :company_phones do |t|
      t.string :number
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
