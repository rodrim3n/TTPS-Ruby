class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string   :name, null: false
      t.string   :surname, null: false
      t.string   :gender, null: false
      t.integer  :dni, null: false, unique: true
      t.date     :birthdate, null: false
      t.string   :cui, null: false

      t.timestamps null: false
    end
  end
end
