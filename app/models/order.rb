class Order < ApplicationRecord
  belongs_to :user
  has_many :carted_products
  has_many :products, through: :carted_products

  def calculate_subtotal
    @subtotal = 0
    carted_products.each do |carted_product|
      @subtotal += carted_product.product.price * carted_product.quantity
    end
  end

  def subtotal
    @subtotal
  end

  def tax
    (@subtotal*0.09).round(2)
  end

  def total
    @subtotal + tax
  end
end
