class Route < ApplicationRecord
  has_many :stations_routes, class_name: "StationsRoute", foreign_key: "route_id"
  has_many :railway_stations, through: :stations_routes, dependent: :destroy
  has_many :trains, class_name: "Train", foreign_key: "route_id"

  validates :name, presence: true, uniqueness: true
  # validate :stations_count

  private

  def self.search_routes(from, to)
    routes = []
    result = []
    to.routes.each do |route|
      station = route.railway_stations.where(id: from.id).first
      position_from = route.stations_routes.where(railway_station_id: from.id).first.try(:position)
      position_to = route.stations_routes.where(railway_station_id: to.id).first.try(:position)
      if position_from.present? && position_to.present?
        if position_from < position_to && !station.nil?
          routes << station.routes.find_by(id: route.id)
        end
      end
    end
    routes.each do |route|
      result << route if !route.trains.present?
    end
    return result
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

  # def stations_count
  #   errors.add(:base, "Route should contain at least 2 stations #{railway_stations.inspect}") if railway_stations.size < 2
  # end
end