class RenameOderDetailsToOrderDetails < ActiveRecord::Migration[6.1]
  def change
    remove_column :oder_details, :deli_receiver
    remove_column :oder_details, :deli_address
    remove_column :oder_details, :deli_phone
    rename_table :oder_details, :order_details
  end
end
