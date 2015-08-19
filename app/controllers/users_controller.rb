class UsersController < ApplicationController

  def create
    user_params["phone_number"] = user_params["phone_number"].gsub(/\D/, '').to_s
    user = User.create(user_params)
    redirect_to quickstart_path(user)
  end
  #
  # def drive_upload
  # drive = Google::Apis::DriveV2::DriveService.new
  # drive.authorization.client_id = @@CLIENT_ID
  # drive.authorization.redirect_uri = @@REDIRECT_URI
  # drive.authorization.scope = @@SCOPES
  # drive_api = drive.discovered_api('drive', 'v2')
  # binding.pry
  # params[:images].each do |image|
  #   File.open(image.tempfile) do |file|
  #     binding.pry
  #   end
  # end
  # end

private

  def user_params
    params.require(:user).permit(:name, :phone_number, :instagram_handler, :snapchat_handler)
  end
end
