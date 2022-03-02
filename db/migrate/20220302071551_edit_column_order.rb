class EditColumnOrder < ActiveRecord::Migration[6.1]
  def change
    change_column :orders, :order_price, :decimal, default: 0
  end
end
