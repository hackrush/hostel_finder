class CreateHostels < ActiveRecord::Migration
  def change
    create_table :hostels do |t|
      t.string :name
      t.string :price
      t.string :location
      t.references :owner, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
