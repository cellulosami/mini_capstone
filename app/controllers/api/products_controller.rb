class Api::ProductsController < ApplicationController
  def index
    @products = Product.all
    render 'index.json.jb'
  end

  def show
    @product = Product.find_by(id: params[:id])
    render 'show.json.jb'
  end

  def create
    @product = Product.new(
      name: params[:name],
      description: params[:description], 
      price: params[:price], 
      image_url: params[:image_url]
    )
    @product.save
    render 'create.json.jb'
  end

  def update
    render 'update.json.jb'
  end
end
