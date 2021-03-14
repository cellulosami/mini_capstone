class AddProductIdToCartedProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :carted_products, :product_id, :integer
  end
end
