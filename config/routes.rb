Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  # namespace :api do
  #   get "/photos" => "photos#index"
  # end
  namespace :api do
    get "/all_products" => "products#display_all"
    get "/one_product" => "products#display_one"

    get "/search_by_id" => "products#display_by_id"
  end
end
