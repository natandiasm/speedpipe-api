require 'sinatra'
require 'json'
require 'mongo'

require_relative 'modules/mongo_connection'

Mongo_connection.init

get '/' do
    content_type :json
    { version: 0.1 }.to_json
end

post '/log/:uuid' do
    content_type :json
    begin
        hash_log = JSON.parse(request.body.read)
        hash_log.to_json
        # db = Mongo_connection.mongo.db('speedpipe')
        collection = Mongo_connection.client['logs']
        collection.insert_one(hash_log)
        {sucess:'doc add'}.to_json
    rescue => exception
        {erro: exception}.to_json
    end
end

# Obtem as informações do log
get '/info/:uuid' do
    "Hello #{params['uuid']}!"
end
