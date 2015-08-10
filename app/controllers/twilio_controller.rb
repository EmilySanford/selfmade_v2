class TwilioController < ApplicationController
  skip_before_action :verify_authenticity_token
#
#
  def quickstart
  account_sid = 'AC6330f311861cdd30da90cba2522e4cc5'
  auth_token = '80f5ed504353b8b438fa852a09379a27'
  @client = Twilio::REST::Client.new account_sid, auth_token
 @client.messages.create(
  from: '+14807253840',
  to: '+13059890148',
  body: 'Hey there!'
)
  end
#   twiml.text
end
