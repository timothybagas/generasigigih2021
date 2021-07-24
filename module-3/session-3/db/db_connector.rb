require 'mysql2'

def create_db_client
	Mysql2::Client.new(
		:host => "localhost",
		:username => ENV["DB_USSERNAME"],
		:password => ENV["DB_PASSWORD"],
		:database => ENV["DB_NAME"])
end
