class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  before_action :collect_stations

  def index
    @tickets = current_user.tickets.all
  end

  # GET /tickets/1
  def show
  end

  # GET /tickets/new
  def new
    @ticket = Ticket.new
    @from = params[:start_station_id]
    @to = params[:end_station_id]
    @route = Route.find_by(id: params[:route])
  end


  # POST /tickets
  def create
    @ticket = Ticket.new(ticket_params.merge(user_id: current_user.id))
    if @ticket.save
      redirect_to @ticket, notice: 'Ticket was successfully created.'
    else
      render :new
    end
  end


  # DELETE /tickets/1
  def destroy
    @ticket.destroy
    redirect_to tickets_url, notice: 'Ticket was successfully destroyed.'
  end

  private
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    def ticket_params
      params.require(:ticket).permit(:start_station_id, :end_station_id, :train_id, :passport, :person, :carriage_id)
    end

    def collect_stations
      @railway_stations = RailwayStation.all
    end
end