class Api::OrdersController < ApplicationController
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
        subtotal: @product.price,
        tax: @product.tax,
        total: @product.total
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