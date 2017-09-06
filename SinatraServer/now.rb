require 'sinatra'

get '/' do
	DateTime.now
end

get '/io' do
  sleep(0.7)
end
