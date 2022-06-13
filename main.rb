require 'sinatra'
require 'json'


get '/' do
    content_type :json
    { version: 0.1 }.to_json
end

get '/verify_mongo' do
    ENV['DOKKU_MONGO_SPEEDPIPE_API_POR']
end

# Obtem as informações do log
get '/info/:uuid' do
    "Hello #{params['uuid']}!"
end
