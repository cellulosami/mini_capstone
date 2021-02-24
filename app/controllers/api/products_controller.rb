class Api::ProductsController < ApplicationController
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

  def display_one
    @product = {}
    @product[:name] = Product.first[:name]
    @product[:price] = Product.first[:price]
    @product[:description] = Product.first[:description]
    @product[:image_url] = Product.first[:image_url]
    render "one_product.json.jb"
  end
end
