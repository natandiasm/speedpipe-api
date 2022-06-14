module Mongo_connection
    @uri = Mongo::URI.new(ENV['MONGO_URL'])
    @client = Mongo::Client.new(@uri.servers, @uri.options)
    @client.login(@uri.credentials)
    @client[@uri.database]
    def self.cli
        @client
    end
end
