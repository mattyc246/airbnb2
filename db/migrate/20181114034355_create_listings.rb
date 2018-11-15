class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.belongs_to :user
      t.string :title
      t.string :property_type
      t.integer :guests
      t.integer :bedrooms
      t.integer :bathrooms
      t.integer :price_per_night
      t.string :address_line1
      t.string :city
      t.string :state
      t.string :postcode
      t.string :country
      t.timestamps
    end
  end
end
