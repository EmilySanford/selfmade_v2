class UsersController < ApplicationController
  def create
    user_params['phone_number'] = user_params["phone_number"].gsub(/\D/, '').to_s
    user = User.create(user_params)
    redirect_to quickstart_path(user)
    # redirect_to controller: 'pages', action: "index", id: user.id
  end

  def new
    @user = User.new
  end

  def destroy
    @user = User.find(params[:id])
		redirect_to(admins_path) if @user.destroy
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
