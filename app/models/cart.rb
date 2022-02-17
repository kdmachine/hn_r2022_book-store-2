class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :book

  CART_PROPERTIES = %i(user_id book_id date_add quantity).freeze
end
