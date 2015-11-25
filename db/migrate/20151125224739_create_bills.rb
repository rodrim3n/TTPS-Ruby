class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.references :person, index: true, foreign_key: true
      t.references :client, index: true, foreign_key: true
      t.text :description
      t.float :total, null: false
      t.date :emission_date,  false

      t.timestamps null: false
    end
  end
end
