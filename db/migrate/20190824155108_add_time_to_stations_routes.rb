class AddTimeToStationsRoutes < ActiveRecord::Migration[5.2]
  def change
    add_column :stations_routes, :time, :string
  end
end
