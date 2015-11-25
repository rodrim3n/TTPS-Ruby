class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name, null: false
      t.string :cui, null: false, unique: true

      t.timestamps null: false
    end
  end
end
