class TwilioController < ApplicationController
  skip_before_filter :verify_authenticity_token
  ACCOUNT_SID = 'AC88068d1ee49052acdc5a8bc1e1ef8b5e'
  ACCOUNT_TOKEN = '3029f8f189ab401f6f22961317f4dc51'
  
  include Webhookable
 
  after_filter :set_header
 
  def voice
    @game = Game.first
    response = Twilio::TwiML::Response.new do |r|
      r.Say "Our next game will be on field #{@games.field} at #{@game.start_at}. We are going to beat the shit out of #{@game.opponent}", :voice => 'alice'
         r.Play 'http://linode.rabasa.com/cantina.mp3'
      r.Dial '14178802516'
    end
 
    render_twiml response
  end


  def sms
    @game = Game.first
    render 'sms.xml.erb', :content_type => 'text/xml'
  end

  


end
