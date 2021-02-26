class Api::ProductsController < ApplicationController
  def index
    @products = Product.all
    render 'index.json.jb'
  end

  def display_by_id
    user_input_id = params[:id].to_i
    product = Product.find_by(id: user_input_id)

    @product_info = {}
    @product_info[:name] = product[:name]
    @product_info[:price] = product[:price]
    @product_info[:description] = product[:description]
    @product_info[:image_url] = product[:image_url]
    render 'display.json.jb'
  end

  def display
    user_input_attribute = params[:attribute]
    user_input_value = params[:value]
    product = Product.find_by(user_input_attribute => user_input_value)

    @product_info = {}
    @product_info[:name] = product[:name]
    @product_info[:price] = product[:price]
    @product_info[:description] = product[:description]
    @product_info[:image_url] = product[:image_url]
    render "display.json.jb"
  end
end
