class Api::OrdersController < ApplicationController
  before_action :authenticate_user
  
  def index
    if current_user
      @orders = Order.where("user_id = ?", current_user.id)
      render "index.json.jb"
    else
      render json: { message: "the walls have eyes" }
    end
  end

  def show
    @order = Order.find_by(id: params[:id])
    render "show.json.jb"
  end

  def create
    if current_user
      @product = Product.find_by(id: params[:product_id])
      @order = Order.new(
        product_id: params[:product_id],
        user_id: current_user.id,
        quantity: params[:quantity],
        subtotal: (@product.price * params[:quantity].to_i),
        tax: (@product.tax * params[:quantity].to_i),
        total: (@product.total * params[:quantity].to_i)
      )
      @order.save
      render "show.json.jb"
    else
      render json: { message: "yo what the hell" }
    end
  end
end

#i have manual product creation. now i need:
# - automatic calculation of subtotal, tax, and total