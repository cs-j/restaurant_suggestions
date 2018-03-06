class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :description
      t.string :address
      t.string :location
      t.string :cuisine
      t.string :keyword
      t.timestamps
    end
  end
end
