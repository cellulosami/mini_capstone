class Api::OrdersController < ApplicationController
  def show
    @order = Order.first
    render "show.json.jb"
  end
end
