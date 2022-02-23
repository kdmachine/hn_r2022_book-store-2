class AddOrderPriceToOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :order_price, :decimal
  end
end
