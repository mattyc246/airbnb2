class CreateListingsTags < ActiveRecord::Migration[5.2]
  def change
    create_table :listings_tags do |t|
      t.belongs_to :tag
      t.belongs_to :listing
      t.timestamps
    end
  end
end
