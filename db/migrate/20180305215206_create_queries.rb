class CreateQueries < ActiveRecord::Migration[5.1]
  def change
    create_table :queries do |t|
      t.string :location
      t.string :keyword
      t.integer :user_id

      t.timestamps
    end
  end
end
