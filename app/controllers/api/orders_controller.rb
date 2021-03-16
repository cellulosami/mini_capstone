class Api::OrdersController < ApplicationController
  before_action :authenticate_user
  
  def index
    @orders = Order.where("user_id = ?", current_user.id)
    render "index.json.jb"
  end

  def show
    @order = Order.find_by(id: params[:id])
    render "show.json.jb"
  end

  def create
    @carted_products = CartedProduct.where("status = 'carted' AND user_id = #{current_user.id}")

    @subtotal = 0
    @carted_products.each do |carted_product|
      @subtotal += carted_product.product.price * carted_product.quantity
    end
    @tax = (@subtotal*0.09).round(2)
    @total = @subtotal + @tax

    @order = Order.new(
      user_id: current_user.id,
      subtotal: @subtotal,
      tax: @tax,
      total: @total
    )
    @order.save

    @carted_products.each do |carted_product|
      carted_product.update(status: "purchased")
      carted_product.update(order_id: @order.id)
    end

    render "show.json.jb"
  end
end