class RoutesController < ApplicationController
  before_action :set_route, only: [:show, :edit, :update, :destroy]
  before_action :set_stations, only: [:show, :edit, :update, :destroy]

  def index
    @routes = Route.all
  end

  def show
    @stations = @route.railway_stations.order(:position)
  end

  def new
    @route = Route.new
  end

  def create
    @railway_stations = RailwayStation.find(params[:model_ids])
    @route = Route.new(params_route)
      if @route.save
        @route.railway_stations = @railway_stations
        @times = params[:times]
        Route.set_times(@route, @times)
        redirect_to @route
      else
        render :new
      end
  end

  def edit
  end

  def update
    @railway_stations = RailwayStation.find(params[:model_ids])
    if @route.update(params_route)
      @route.railway_stations = @railway_stations
      @times = params[:times]
      Route.set_times(@route, @times)
      redirect_to @route
    else
      render :edit
    end
  end

  def destroy
    @route.destroy
    redirect_to routes_path
  end


  private

  def params_route
    params.require(:route).permit(:name, :time)
  end

  def set_route
    @route = Route.find(params[:id])
  end

  def set_stations
    @sr = @route.stations_routes.order(:position).all
  end
end