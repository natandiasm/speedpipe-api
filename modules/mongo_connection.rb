module Mongo_connection
    @mongo = Mongo::Client.new([ENV['MONGO_URL']], :database => 'speedpipe')
    def self.mongo
        @mongo
    end
end
