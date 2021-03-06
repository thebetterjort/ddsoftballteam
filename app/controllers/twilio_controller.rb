class TwilioController < ApplicationController
  skip_before_filter :verify_authenticity_token
  ACCOUNT_SID = ENV['TWILIO_ACC_SID']
  ACCOUNT_TOKEN = ENV['TWILIO_TOKEN']
  
  include Webhookable
 
  after_filter :set_header
 
  def voice
    @game = Game.last
    response = Twilio::TwiML::Response.new do |r|
      r.Say "Our next game will be on field #{@game.field} at #{@game.start_at}. We are going to beat the shit out of #{@game.opponent}", :voice => 'alice'
      @game = Game.first
      r.Say "Our last game the score was #{@game.home_score} to #{@game.away_score}. We #{@game.win_loss}!"
         r.Play 'http://linode.rabasa.com/cantina.mp3'
     
    end
 
    render_twiml response
  end


  def sms
    @game = Game.last
    render 'sms.xml.erb', :content_type => 'text/xml'
  end

  


end
