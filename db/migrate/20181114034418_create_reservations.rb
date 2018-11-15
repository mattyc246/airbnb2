class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.belongs_to :user
      t.belongs_to :listing
      t.date :check_in
      t.date :check_out
      t.boolean :payment_status, default: false
      t.timestamps
    end
  end
end
