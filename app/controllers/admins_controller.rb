class AdminsController < ApplicationController
  before_action :authenticate_admin!

  @@account_sid = 'AC6330f311861cdd30da90cba2522e4cc5'
  @@auth_token = '80f5ed504353b8b438fa852a09379a27'

  def index
    @users = User.all
  end
end
