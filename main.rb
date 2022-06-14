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
    begin
        res = JSON.parse(request.body.read)
        doc_mongo = {}
        doc_mongo['uuid'] = params['uuid']
        doc_mongo['logs'] = []
        doc_mongo['logs'] << res
        collection = Mongo_connection.client['logs']
        collection.insert_one(doc_mongo)

        {sucess:'doc add'}.to_json
    rescue => exception
        {error: exception, data: res}.to_json
    end
end

patch '/log/:uuid' do
    content_type :json
    begin
        hash_log = JSON.parse(request.body.read)
        collection = Mongo_connection.client['logs']
        doc_mongo = collection.find({uuid: params['uuid']}).to_a.first
        update_doc = {}
        update_doc['logs'] = doc_mongo['logs']
        update_doc['logs'] << hash_log
        collection.update_one({"_id" => doc_mongo["_id"]}, {"$set" => update_doc})
        {sucess:update_doc['logs']}.to_json
    rescue => exception
        {error: exception}.to_json
    end
end

# Obtem as informações do log
get '/log/:uuid' do
    content_type :json
    begin
        collection = Mongo_connection.client['logs']
        doc_mongo = collection.find({uuid: params['uuid']}).to_a.first
        doc_mongo.delete!('_id')
        doc_mongo.to_h.to_json
    rescue => exception
        {mgs: 'Id not found'}.to_json
    end
end
