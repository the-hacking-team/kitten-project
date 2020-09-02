class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :is_my_profile, only: [:show]

  def show
    @user = current_user
  end

private

def is_my_profile
  unless current_user == User.find(params[:id])
    flash[:danger] = "Tu ne peux accéder qu'aux informations de ton compte"
    redirect_to :root
  end
end

end
