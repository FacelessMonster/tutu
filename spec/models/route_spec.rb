require "rails_helper"

describe Route, '.set_times' do
  it "sets time for stations on the route" do
    route = Route.create(name: "Moscow - Vladivostok")
    first_station = RailwayStation.create(title: "Moscow")
    last_station = RailwayStation.create(title: "Vladivostok")
    route.stations_routes.create(railway_station_id: first_station.id)
    route.stations_routes.create(railway_station_id: last_station.id)
    times = { first_station.id => '10:00', last_station.id => '22:00' }
    Route.set_times(route, times)
    expect(StationsRoute.where(railway_station_id: first_station.id).first.time).to eq '10:00'
  end
end
