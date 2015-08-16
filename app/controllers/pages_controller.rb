class PagesController < ApplicationController
  
  def phonenumber_logic
  #  phonenumber = params[:phone_number].gsub(/\D/, '')
  #  if phonenumber.length == 10
  #  if params[:phone_number].match(/\(?([0-9]{3})\)?([ .-]?)([0-9]{3})\2([0-9]{4})/) != nil and params[:phone_number].gsub(/\D/, '').length == 10
     phone_number = params[:phone_number].gsub(/\D/, '').to_s
     user = User.create(phone_number: phone_number)
     redirect_to google_survey_path(user)
 #   else
 #     flash[:error] = "Phone Number Wrong Please try Again"
 #     redirect_to root_path
 #   end
  end

  def google_survey
    @user = User.find(params[:id])
  end

end
