class AddNoteToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :note, :string
  end
end
