class CartsController < ApplicationController
  before_action :init_cart

  def new; end

  def create
    @cart_params = params[:cart]
    cur_cart_item = @cart.map do |item|
      next item if item["book_id"] == @cart_params["book_id"].to_i
    end
    if cur_cart_item.compact!.present?
      cur_cart_item[0]["quantity"] += @cart_params["quantity"].to_i
    else
      @cart << {
        "book_id": @cart_params["book_id"].to_i,
        "quantity": @cart_params["quantity"].to_i
      }
    end
    refresh
  end

  def destroy
    @cart.reject! do |item|
      item["book_id"] == params[:book_id].to_i
    end
    refresh
  end

  private
  def cart_params
    params.require(:cart).permit Cart::CART_PROPERTIES
  end
end
