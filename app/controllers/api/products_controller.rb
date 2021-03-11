class Api::ProductsController < ApplicationController
  before_action :authenticate_admin, only: [:create, :update, :destroy]

  def index
    if current_user
      if params[:search]
        @products = Product.where("name ILIKE '%#{params[:search]}%'")
      else
        @products = Product.all
      end

      params[:sort] = params[:sort] || "id"
      params[:sort_order] = params[:sort_order] || "asc"
      @products = @products.order("#{params[:sort]} #{params[:sort_order].upcase}")

      if params[:discount]
        params[:discount_price] = params[:discount_price] || 20
        params[:discount_price] = params[:discount_price].to_i
        @products = @products.where("price < #{params[:discount_price]}")
      end
    else
      @products = []
    end
    
    p current_user
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
      supplier_id: params[:supplier_id]
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
