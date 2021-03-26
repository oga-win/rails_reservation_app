class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.references :user, foreign_key: true
      t.references :room, foreign_key: true
      t.datetime :start_date
      t.datetime :last_date
      t.integer :people

      t.timestamps
    end
  end
end
