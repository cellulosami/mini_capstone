class Api::CartedProductsController < ApplicationController
  before_action :authenticate_user

  def create
    @carted_product = CartedProduct.new(
      product_id: params[:product_id],
      quantity: params[:quantity],
      user_id: current_user.id,
      status: "carted"
    )
    @carted_product.save
    render "show.json.jb"
  end

  def index
    @carted_products = CartedProduct.where("status = 'carted' AND user_id = #{current_user.id}")
    render "index.json.jb"
  end

  def destroy
    @carted_product = CartedProduct.find(params[:id])
    @carted_product.update(status: "removed")
    render json: { message: "#{@carted_product.product.name} has been removed from your cart."}
  end
end
