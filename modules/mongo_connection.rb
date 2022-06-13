module Mongo_connection
    @con = Mongo::Client.new([""], :database => "", user: "#{ENV[""]}", password: "#{ENV[""]}", auth_source: "#{ENV[""]}", auth_mech: :scram)

    def self.con
        @con
    end
end
