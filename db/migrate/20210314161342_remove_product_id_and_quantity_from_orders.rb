class RemoveProductIdAndQuantityFromOrders < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :product_id
    remove_column :orders, :quantity
  end
end
