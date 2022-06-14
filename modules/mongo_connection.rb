module Mongo_connection
    @uri = Mongo::URI.new(ENV['MONGO_URL'])
    @client = Mongo::Client.new(@uri.servers, @uri.options, @uri.credentials, @uri.database)
    def self.cli
        @client
    end
end
