class CreateEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :employees do |t|
      t.references :company, foreign_key: true
      t.string :last_name
      t.string :first_name
      t.string :phone_number

      t.timestamps
    end
  end
end
