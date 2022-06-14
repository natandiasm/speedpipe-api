module Mongo_connection
    @uri = Mongo::URI.new(ENV['MONGO_URL'])
    @client = Mongo::Client.new(ENV['MONGO_URL'])

    def self.client
        @client
    end
end
