require "pry"
require "sinatra"
require "sinatra/reloader"

require_relative 'models/calculate.rb'

get "/" do
	erb(:index)
end


post "/calculate" do
	operation = Calculate.new(params[:n1], params[:n2],params[:btn])
	result = operation.calculate
	"The result of #{params[:n1]} #{params[:btn]} #{params[:n2]} equals #{result}"
end

get "/add" do
	erb(:add)
end

post "/calculate_add" do
	first = params[:n1].to_f
	second = params[:n2].to_f
	result = first + second
	"#{first} + #{second} = #{result}"
end