class TwilioController < ApplicationController
  skip_before_filter :verify_authenticity_token
  ACCOUNT_SID = 'AC88068d1ee49052acdc5a8bc1e1ef8b51'
  ACCOUNT_TOKEN = '3029f8f189ab401f6f22961317f4dc5e'
  
  
 
  after_filter :set_header
 
  def voice
     @game = Game.last
    response = Twilio::TwiML::Response.new do |r|
      r.Say "Our next game will be on field #{@game.field}. The Game will start at #{@game.start_at}. We are going to beat the shit out of #{@game.opponent}", :voice => 'alice'
         r.Play 'http://linode.rabasa.com/cantina.mp3'
      r.Dial '14178802516'
    end
 
    render_twiml response
  end
  


  def sms
    @game = Game.last
    render 'sms.xml.erb', :content_type => 'text/xml'
  end

  


end