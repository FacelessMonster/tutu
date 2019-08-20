class AddPositionToRouteStations < ActiveRecord::Migration[5.2]
  def change
    add_column :stations_routes, :position, :integer
  end
end
