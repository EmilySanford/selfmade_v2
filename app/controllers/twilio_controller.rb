class TwilioController < ApplicationController
  before_action :authenticate_admin!, only: [:show_text_conversations]

@@account_sid = 'AC6330f311861cdd30da90cba2522e4cc5'
@@auth_token = '80f5ed504353b8b438fa852a09379a27'

  def quickstart
  user = User.find(params[:id])
  client = Twilio::REST::Client.new @@account_sid, @@auth_token
  client.messages.create(
  from: '+1 3059890148',
  to: '+1' + user.phone_number,
  body: "Thank you #{user.name} for choosing SelfMade.")
  redirect_to root_path
  end

  def show_text_conversations
    client = Twilio::REST::Client.new @@account_sid, @@auth_token
    @user = User.find(params[:id])
    received_messages = client.account.messages.list(from: '+1' + @user.phone_number)
    sent_messages = client.account.messages.list(to: '+1' + @user.phone_number)
    all_messages = received_messages | sent_messages
    @sorted_all_messages = all_messages.sort do |m1, m2|
      DateTime.strptime(m1.date_sent, '%A, %d %b %Y %H:%M:%S %z') <=>   DateTime.strptime(m2.date_sent, '%A, %d %b %Y %H:%M:%S %z')
    end
  end
end
