class AddIndexes < ActiveRecord::Migration[5.2]
  def change
    add_index :carriages, [:type, :train_id]
    add_index :stations_routes, [:railway_station_id, :route_id]
    add_index :tickets, :user_id
    add_index :trains, :route_id
  end
end
