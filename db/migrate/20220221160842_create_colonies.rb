class CreateColonies < ActiveRecord::Migration[6.1]
  def change
    create_table :colonies do |t|
      t.string :name
      t.text :description
      t.string :location
      t.integer :population
      t.integer :hostility

      t.timestamps
    end
  end
end
