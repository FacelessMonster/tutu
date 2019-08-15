class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  def index
    @tickets = Ticket.all
  end

  # GET /tickets/1
  def show
  end

  # GET /tickets/new
  def new
    @ticket = Ticket.new
    @railway_stations = RailwayStation.all
  end

  # GET /tickets/1/edit
  def edit
    @railway_stations = RailwayStation.all
  end

  # POST /tickets
  def create
    @railway_stations = RailwayStation.all
    @ticket = Ticket.new(ticket_params.merge(user_id: current_user.id))
    if @ticket.save
      redirect_to @ticket, notice: 'Ticket was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /tickets/1
  # PATCH/PUT /tickets/1.json
  def update
    @railway_stations = RailwayStation.all
    if @ticket.update(ticket_params)
      redirect_to @ticket, notice: 'Ticket was successfully updated.'
    else
      render :edit
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
end