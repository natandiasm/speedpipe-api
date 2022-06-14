module Mongo_connection
    @mongo = Mongo::Connection.from_uri(ENV['MONGO_URL'])

    def self.mongo
        @mongo
    end
end
