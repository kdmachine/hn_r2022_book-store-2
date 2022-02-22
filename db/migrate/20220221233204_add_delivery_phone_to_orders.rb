class AddDeliveryPhoneToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :delivery_phone, :string
  end
end
