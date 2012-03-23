require 'rubygems'
require 'sinatra'
require 'uri'
require 'net/https'
require 'json'

API_URL = "http://api.recessmobile.com/api"
API_KEY = "[API KEY GOES HERE]"

# coach's tag => coach's name
COACHES = {
  '1111111111' => 'coach1',
  '2222222222' => 'coach2'
}

# player's phone => player's name
PLAYERS = {
  '5551111111' => 'player1',
  '5552222222' => 'player2'
}

get '/' do
  erb :index
end

post '/send_message' do
  command = 'send_message'
  data = {
    :api_key      => API_KEY,
    :phone_number => params[:phone],
    :body         => params[:tag] + ': ' + params[:message],
    :tag          => params[:tag]
  }
  res = Net::HTTP.post_form(URI.parse(API_URL + "/" + command), data)
  
  if res.code.to_i == 500
    res.body
  else
    'Message was successfully sent using one of SL application phone numbers. Player should reply to this SL application phone number (not a coach tag/number).'
  end
end

# Please specify http://[HOST OF THIS DEMO APP]/gateway as Gateway URL for your SL application
post '/gateway' do
  if params[:type] == 'incoming_message'
    puts "We've got message from player with number #{params[:phone_number]}: "
    puts params[:body]
    puts "This message should be routed to coach with tag: #{params[:tag]}" unless params[:tag].nil?
  end
end
