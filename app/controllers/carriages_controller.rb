class CarriagesController < ApplicationController
  def create
    @train = Train.find(params[:train_id])
    @train.carriages.create(params_carriage)
    redirect_to train_path(@train)
  end

  # def destroy
  #   @carriage = Carriage.find(params[:carriage_id])
  # end

  private

  def params_carriage
    params.require(:carriage).permit(:type, :seats)
  end
end