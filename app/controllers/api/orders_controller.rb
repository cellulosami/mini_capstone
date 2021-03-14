class Api::OrdersController < ApplicationController
  before_action :authenticate_user
  
  def index
    @orders = Order.where("user_id = ?", current_user.id)
    render "index.json.jb"
  end

  def show
    @order = Order.find_by(id: params[:id])
    @order.calculate_subtotal
    render "show.json.jb"
  end

  def create
    @carted_products = CartedProduct.where("status = 'carted' AND user_id = #{current_user.id}")

    @order = Order.new(
      user_id: current_user.id
    )
    @order.save

    @carted_products.each do |carted_product|
      carted_product.update(status: "purchased")
      carted_product.update(order_id: @order.id)
    end
    @order.calculate_subtotal

    render "show.json.jb"
  end
end

#i have manual product creation. now i need:
# - automatic calculation of subtotal, tax, and total