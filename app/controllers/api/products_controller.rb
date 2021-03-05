class Api::ProductsController < ApplicationController
  def index
    @products = Product.all
    if params[:sort]
      params[:sort_order] = params[:sort_order] || "asc"
      @products = @products.order("#{params[:sort]} #{params[:sort_order].upcase}")
    else
      @products = @products.order("id ASC")
    end
    if params[:discount]
      @products = @products.where("price < 20")
    end
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
    if @product.save
      render 'show.json.jb'
    else
      render json: {errors: @product.errors.full_messages}
    end
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product[:name] = params[:name] || @product[:name]
    @product[:description] = params[:description] || @product[:description]
    @product[:price] = params[:price] || @product[:price]
    @product[:image_url] = params[:image_url] || @product[:image_url]
    if @product.save
      render 'show.json.jb'
    else
      render json: {errors: @product.errors.full_messages}
    end
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    render json: {message: "The product was deleted."}
  end
end
