module Mongo_connection
    @uri = Mongo::URI.new('mongodb://localhost:27017')
    @client = Mongo::Client.new(@uri.servers, @uri.options)
    def self.client
        @client
    end
end
