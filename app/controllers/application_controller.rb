class ApplicationController < ActionController::Base

  private
  def check_admin
    unless current_user.admin?
      redirect_to root_path, notice: "No rights."
    end
  end
end
