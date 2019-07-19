class AddRouteToTrain < ActiveRecord::Migration[5.2]
  def change
    add_column :trains, :route_id, :integer
  end
end
