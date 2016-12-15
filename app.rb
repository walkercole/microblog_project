require "sinatra"
require "sinatra/activerecord"

set :database, {adapter: "sqlite3", database: "mydb.sqlite3"}
require "./models"

get "/" do
	"hello world"
end