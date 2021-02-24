class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, if: -> { request.format.html? }

  def display_all
    @all_products = []
    Product.all.each do |product|
      current_product = {}
      current_product[:name] = product[:name]
      current_product[:price] = product[:price]
      current_product[:description] = product[:description]
      current_product[:image_url] = product[:image_url]
      @all_products << current_product
    end
    
    render "all_products.json.jb"
  end
end
