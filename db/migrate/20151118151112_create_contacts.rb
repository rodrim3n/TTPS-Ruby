class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :source, null: false
      t.string :value, null: false
      t.references :client, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
