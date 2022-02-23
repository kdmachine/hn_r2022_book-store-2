class StoreController < ApplicationController
  before_action :init_cart, only: %i(cart checkout)

  def home; end

  def cart; end

  def category; end

  def checkout; end

  def order; end
end
