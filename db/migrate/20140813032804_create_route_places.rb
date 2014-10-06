class CreateRoutePlaces < ActiveRecord::Migration
  def change
    create_table :route_places do |t|
      t.string :name
      t.string :description
      t.decimal :latitude
      t.decimal :longitude
      t.references :routes, index: true
      t.integer :order

      t.timestamps
    end
  end
end
