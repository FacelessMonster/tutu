class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.integer :number
      t.integer :train_id
      t.integer :start_station_id
      t.integer :end_station_id
      t.timestamps
    end
  end
end
