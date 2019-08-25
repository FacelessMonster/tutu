class Route < ApplicationRecord
  has_many :stations_routes, class_name: "StationsRoute", foreign_key: "route_id"
  has_many :railway_stations, through: :stations_routes, dependent: :destroy
  has_many :trains, class_name: "Train", foreign_key: "route_id"

  # validates :name, uniqueness: true
  def self.search_routes(from, to)
    routes = []
    to.routes.each do |route|
      station = route.railway_stations.where(id: from.id).first
      routes << station.routes.find_by(id: route.id) unless station.nil?
    end
    return routes
  end

  def self.set_times(route, times)
    times.each do |k, v|
      if v.length > 0
        time = route.stations_routes.where(railway_station_id: k).first
        time.time = v.to_s
        time.save
      end
    end
  end
end