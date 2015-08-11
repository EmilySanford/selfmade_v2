class TwilioController < ApplicationController
  skip_before_action :verify_authenticity_token
# =>
@@account_sid = 'AC6330f311861cdd30da90cba2522e4cc5'
@@auth_token = '80f5ed504353b8b438fa852a09379a27'
#
  def quickstart
  @client = Twilio::REST::Client.new @@account_sid, @@auth_token
 @client.messages.create(
  from: '+14807253840',
  to: '+19737221106',
  body: 'Fantastic 4',
  media_url: 'http://www.washingtonpost.com/news/morning-mix/wp-content/uploads/sites/21/2014/09/Grumpy_Cat_Endorsement-017d7-ULFU.jpg'
)
# @client.messages.create(
#  from: '+14807253840',
#  to: '+13059890148',
#  body: 'Fantastic 4',
#    media_url: 'http://www.washingtonpost.com/news/morning-mix/wp-content/uploads/sites/21/2014/09/Grumpy_Cat_Endorsement-017d7-ULFU.jpg'
# )
  redirect_to root_path
  end
#   twiml.text
end


 class Moo
@@name = "milky"
def name
  @@name
end

def name=(name)
  @@name = name
end
end
