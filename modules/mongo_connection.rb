module Mongo_connection
    @con = Mongo::Client.new(["95.217.227.107:27017"], :database => "external_contribution_miami", user: "#{ENV["DB_LOGIN"]}", password: "#{ENV["DB_PASSWD"]}", auth_source: "#{ENV["auth_source"]}", auth_mech: :scram)

    def self.con
        @con
    end
end
