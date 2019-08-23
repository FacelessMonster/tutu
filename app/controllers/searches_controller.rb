class SearchesController < ApplicationController
  def show
  end

  def new
    @from = RailwayStation.find_by(title: params[:from])
    @to = RailwayStation.find_by(title: params[:to])
    @test = []
    if !@from.nil? && !@to.nil?
      @to.routes.each do |route|
        station = route.railway_stations.where(id: @from.id).first
        @test << station.routes.find_by(id: route.id)
      end
    else
      redirect_to "/search", notice: "Маршрут не найден"
    end
  end
end