class PlusItemsController < ApplicationController
  before_action :init_cart
  before_action :get_cart_book

  def update
    @get_cart_book["quantity"] += Settings.one
    refresh
  end
end
