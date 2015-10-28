class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :make
      t.string :mmodel
      t.integer :yr
      t.string :color
      t.string :vin
      t.string :owner

      t.timestamps null: false
    end
  end
end
