require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:main_page)
end

# Square Values
get("/square/new") do
  erb(:square)
end

get("/square/result") do
  @number = params.fetch("number").to_i
  @square = @number ** 2
  erb(:square_result)
end

# Square Root Values
get("/square_root/new") do
  erb(:square_root)
end

get("/square_root/results") do
  @number = params.fetch("number").to_i
  @square_root_val = @number ** 0.5
  erb(:square_root_results)
end

# Payment Form

get("/payment/new") do
  erb(:payment)
end

get("/payment/results") do
  @apr = params.fetch("apr").to_i
  @years = params.fetch("years").to_i
  @principal = params.fetch("principal").to_i

  numerator = @apr * @principal
  denominator = 1 - ((1 + @apr) ** (-@years))

  @payment = numerator / denominator
end
