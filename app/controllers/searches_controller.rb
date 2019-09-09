class SearchesController < ApplicationController
  def show
  end

  def new
    @from = RailwayStation.find_by(title: params[:from].capitalize)
    @to = RailwayStation.find_by(title: params[:to].capitalize)
    if !@from.nil? && !@to.nil?
      @routes = Route.search_routes(@from, @to)
    else
      redirect_to "/search", alert: t('no_route')
    end
  end
end