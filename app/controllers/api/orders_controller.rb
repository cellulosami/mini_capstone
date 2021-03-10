class Api::OrdersController < ApplicationController
  def show
    @order = Order.find_by(id: params[:id])
    render "show.json.jb"
  end

  def create
    @order = Order.new(
      product_id: params[:product_id],
      user_id: params[:user_id],
      quantity: params[:quantity],
      subtotal: params[:subtotal],
      tax: params[:tax],
      total: params[:total]
    )
    @order.save
    render "show.json.jb"
  end
end
