module Mongo_connection
    @uri = Mongo::URI.new('mongodb://localhost:27017')
    @client = Mongo::Client.new(@uri.servers, @uri.options)
    @client.login(@uri.credentials)
    @client[@uri.database]
    def self.cli
        @client
    end
end
