class FixColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :order_details, :total_price, :price
  end
end
