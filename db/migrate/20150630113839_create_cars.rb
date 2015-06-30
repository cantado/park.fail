class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :image
      t.string :place
      t.integer :rating_points
      t.integer :rating_count
      t.references :user, index: true, foreign_key: false

      t.timestamps null: false
    end

    add_foreign_key :cars, :users, on_delete: :cascade
  end
end
