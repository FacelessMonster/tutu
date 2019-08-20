class Route < ApplicationRecord
  has_many :stations_routes, class_name: "StationsRoute", foreign_key: "route_id"
  has_many :railway_stations, through: :stations_routes, dependent: :destroy
  has_many :trains, class_name: "Train", foreign_key: "route_id"

  # validates :name, uniqueness: true
end