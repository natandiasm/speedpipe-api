module Mongo_connection
    @uri = Mongo::URI.new(ENV['MONGO_URL'])
    @client = Mongo::Client.new(@uri.servers, @uri.options, password: @uri.credentials, :database => @uri.database)

    def self.client
        @client
    end
end
