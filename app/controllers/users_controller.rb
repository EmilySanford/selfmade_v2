class UsersController < ApplicationController
  def update
    user = User.find(params[:id])
    user.update(user_params)
    user.used_editing_apps = params[:user][:used_editing_apps]
    user.save
    redirect_to quickstart_path(user)
  end

private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :instagram_handler, :snapchat_handler, :age, :location, :used_editing_apps)
  end
end
