require 'sinatra'
require 'json'
require 'mongo'

require_relative 'modules/mongo_connection'


get '/' do
    content_type :json
    { version: 0.1 }.to_json
end

post '/log/:uuid' do
    content_type :json
    hash_log = JSON.parse(request.body.read).symbolize_keys
    hash_log.to_json
    # db = Mongo_connection.mongo.db('speedpipe')
    # collection = db.collection('logs')
    # collection.insert(hash_log)
end

# Obtem as informações do log
get '/info/:uuid' do
    "Hello #{params['uuid']}!"
end
