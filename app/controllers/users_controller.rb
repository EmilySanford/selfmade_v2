class UsersController < ApplicationController
  require 'google/apis/drive_v2'
  Drive = Google::Apis::DriveV2
  @@CLIENT_ID = '1038412690413-qa9s14oj8esohmkovrp0lv9qc05ksj4c.apps.googleusercontent.com'
@@CLIENT_SECRET = 'FYJKUJKuUywWfVa0uvaz_GpM'
@@REDIRECT_URI = 'http://localhost:3000'
@@SCOPES = [
    'https://www.googleapis.com/auth/drive.file',
    'email',
    'profile',
    # Add other requested scopes.
]

  def update
    user = User.find(params[:id])
    user.update(user_params)
    user.used_editing_apps = params[:user][:used_editing_apps]
    user.save if user.changed?
    redirect_to quickstart_path(user)
  end

  def drive_upload
  drive = Google::Apis::DriveV2::DriveService.new
  drive.authorization.client_id = @@CLIENT_ID
  drive.authorization.redirect_uri = @@REDIRECT_URI
  drive.authorization.scope = @@SCOPES
  drive_api = drive.discovered_api('drive', 'v2')
  binding.pry
  params[:images].each do |image|
    File.open(image.tempfile) do |file|
      binding.pry
    end
  end
  end

private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :instagram_handler, :snapchat_handler, :age, :location, :used_editing_apps)
  end
end
