MongoMapper.connection = Mongo::Connection.new('54.251.169.128', 27017,:logger => Rails.logger)
MongoMapper.database = "traffic"

if defined?(PhusionPassenger)
   PhusionPassenger.on_event(:starting_worker_process) do |forked|
     MongoMapper.connection.connect if forked
   end
end
