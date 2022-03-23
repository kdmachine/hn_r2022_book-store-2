class MinusItemsController < ApplicationController
  before_action :init_cart
  before_action :get_cart_book

  def update
    if @get_cart_book["quantity"] > Settings.one
      @get_cart_book["quantity"] -= Settings.one
    end

    respond_to do |format|
      format.js{render "carts/quantity"}
    end
  end
end
