class SearchesController < ApplicationController
  def show
  end

  def new
    @from = RailwayStation.find_by(title: params[:from])
    @to = RailwayStation.find_by(title: params[:to])
    if !@from.nil? && !@to.nil?
      @routes = Route.search_routes(@from, @to)
    else
      redirect_to "/search", notice: "Маршрут не найден"
    end
  end
end