class StoreController < ApplicationController
  before_action :init_cart, only: %i(cart)

  def home; end

  def cart; end

  def category; end

  def product; end

  def order; end

  private
  def init_cart
    session[:cart] ||= []
    @cart = session[:cart]
  end
end
