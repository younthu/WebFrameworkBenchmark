require 'sinatra'

get '/now' do
	DateTime.now
end
