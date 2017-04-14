class CreateEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :number
      t.references :department, foreign_key: true

      t.timestamps
    end
  end
end
