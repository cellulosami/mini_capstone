class Api::OrdersController < ApplicationController
  def show
    @order = Order.find_by(id: params[:id])
    render "show.json.jb"
  end

  def create
    if current_user
      @order = Order.new(
        product_id: params[:product_id],
        user_id: current_user.id,
        quantity: params[:quantity],
        subtotal: params[:subtotal],
        tax: params[:tax],
        total: params[:total]
      )
      @order.save
      render "show.json.jb"
    else
      render json: { message: "yo what the hell" }
    end
  end
end

#i have manual product creation. now i need:
# - automatic association of user_id
# - automatic calculation of subtotal, tax, and total