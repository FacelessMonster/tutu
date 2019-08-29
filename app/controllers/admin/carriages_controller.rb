class Admin::CarriagesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin

  def show
    @carriage = Carriage.find(params[:id])
  end

  def create
    @train = Train.find(params[:train_id])
    @train.carriages.create(params_carriage)
    redirect_to admin_train_path(@train)
  end

  # def destroy
  #   @carriage = Carriage.find(params[:id])
  # end

  private

  def params_carriage
    params.require(:carriage).permit(:type, :seats)
  end
end