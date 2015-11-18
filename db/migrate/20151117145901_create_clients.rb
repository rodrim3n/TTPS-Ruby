class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string   :name
      t.string   :lastname
      t.string   :gender
      t.integer  :dni
      t.date     :birthdate

      t.timestamps null: false
    end
  end
end
