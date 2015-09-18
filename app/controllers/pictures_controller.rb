class PicturesController < ApplicationController

  def new
    @picture = Picture.new
    @user = User.includes(:pictures).where("id = ?", params[:id]).first
    # @user = User.includes(:pictures).where("id = ? AND pictures.original_picture_id = ?", params[:id], nil).references(:pictures)
  end

  def upload
    picture = Picture.new(picture_params)
    redirect_to admins_path if picture.save
  end

  def new_modified
    @user = User.find(params["user_id"])
    @picture = Picture.includes(:modified_pictures).where("id = ?", params["picture_id"]).first
    @modified_picture = Picture.new
  end

  private

  def picture_params
    params.require(:picture).permit(:pic, :user_id, :original_picture_id)
  end
end
