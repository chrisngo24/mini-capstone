Rails.application.routes.draw do
  get "/products" => "products#index"
  get "/merchandise" => "products#show"
  get "/merchandise/:id" => "products#show"

end
