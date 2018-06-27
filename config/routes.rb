Rails.application.routes.draw do
  get "/all_available_products" => "products#all_products"
  get "/first_products" => "products#first"
end
