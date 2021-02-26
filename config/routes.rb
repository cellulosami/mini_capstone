Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  # namespace :api do
  #   get "/photos" => "photos#index"
  # end
  namespace :api do
    get "/products" => "products#index"
    get "/search_by_id" => "products#display_by_id"
    get "/search_by_id/:id" => "products#display_by_id"

    get "search_by/:attribute/:value" => "products#display"
  end
end
