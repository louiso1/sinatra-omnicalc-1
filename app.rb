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
  @number = params.fetch("number").to_f
  @square = @number ** 2
  erb(:square_result)
end

# Square Root Values
get("/square_root/new") do
  erb(:square_root)
end

get("/square_root/results") do
  @number = params.fetch("number").to_f
  @square_root_val = @number ** 0.5
  erb(:square_root_results)
end

# Payment Form
get("/payment/new") do
  erb(:payment)
end

get("/payment/results") do
  apr = (params.fetch("apr").to_f) / 100 / 12
  @apr = apr.to_fs(:percentage, {:precision => 4})

  @years = (params.fetch("years").to_f) * 12

  principal = params.fetch("principal").to_f
  @principal = principal.to_fs(:currency)

  numerator = apr * principal
  denominator = 1 - ((1 + apr) ** (-@years))

  @payment = numerator / denominator
  @payment = @payment.to_fs(:currency)

  erb(:payment_result)
end

# Random
get("/random/new") do
  erb(:random)
end

get("/random/results") do 
  @minimum = params.fetch("minimum").to_f
  @maximum = params.fetch("maximum").to_f
  @random = rand(@minimum..@maximum)
  erb(:random_results)
end
